import 'package:finance_app/common/models/user_model.dart';
//import 'package:finance_app/features/sign_in/sigan_in_state.dart';
import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_classes.dart';

void main() {
  late SignUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;

  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    signUpController = SignUpController(service: mockFirebaseAuthService, secureStorage: mockSecureStorage);
    mockSecureStorage = MockSecureStorage();
    user = UserModel(name: 'User', email: 'user@gmail.com', id: 'idQualquer');
  });

  test('Test Sign up Controller Success State', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());

    when(() => mockSecureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        )).thenAnswer((_) async {});
    
     when(() => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@gmail.com',
        password: 'user@123')).thenAnswer((_) async => user);

    await signUpController.signUp(
        name: 'User', email: 'user@gmail.com', password: 'user@123');
    expect(signUpController.state, isInstanceOf<SignUpSuccessState>());
  });

  test('Test Sign up Controller Error State', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());

    when(() => mockSecureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        )).thenAnswer((_) async {});

    when(() => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@gmail.com',
        password: 'user@123')).thenThrow(Exception());

    await signUpController.signUp(
        name: 'User', email: 'user@gmail.com', password: 'user@123');
    expect(signUpController.state, isInstanceOf<SignUpErrorState>());
  });
}

