import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:finance_app/services/auth_service.dart';
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

  Future<void> signUp({required String name, required String email, required String password}) async {
    _changeState(SignUpLoadingState());

    try {
      await service.signUp(name: name, email: email, password: password);
      _changeState(SignUpSuccessState());
    } catch (e) {
      _changeState(SignUpErrorState(message: e.toString()));
    }
  }
}
