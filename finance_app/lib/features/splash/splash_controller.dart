import 'package:finance_app/features/splash/splash_state.dart';
import 'package:finance_app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;
  SplashState _state = SplashInitialState();

  SplashState get state => _state;

  SplashController(this._service);

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    final result = await _service.readOne(key: "CURRENT_USER");

    if (result != null) {
      _changeState(SplashSuccessState());
    } else {
      _changeState(SplashErrorState());
    }
  }
}
