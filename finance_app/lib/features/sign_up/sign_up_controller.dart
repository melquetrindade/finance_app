import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:finance_app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  final AuthService service;

  SignUpController({required this.service});

  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    final secureStorage = SecureStorage();
    _changeState(SignUpLoadingState());

    try {
      final user =
          await service.signUp(name: name, email: email, password: password);
      if (user.id != null) {
        await secureStorage.write(key: "CURRENT_USER", value: user.toJson());
        _changeState(SignUpSuccessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignUpErrorState(message: e.toString()));
    }
  }
}
