//import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:finance_app/services/secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthService extends Mock implements AuthService{}

class MockSecureStorage extends Mock implements SecureStorage{}