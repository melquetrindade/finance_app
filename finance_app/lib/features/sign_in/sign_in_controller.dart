import 'package:finance_app/features/sign_in/sigan_in_state.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInController extends ChangeNotifier {
  final AuthService service;

  SignInController({required this.service});

  SignInState _state = SignInInitialState();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signIn({required String email, required String password}) async {
    _changeState(SignInLoadingState());

    try {
      await service.signIn(email: email, password: password);
      _changeState(SignInSuccessState());
    } catch (e) {
      _changeState(SignInErrorState(message: e.toString()));
    }
  }
}
