import 'package:finance_app/features/sign_in/sign_in_controller.dart';
import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:finance_app/services/mock_auth_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<AuthService>(() => MockAuthService());

  locator.registerFactory<SignInController>(
      () => SignInController(service: locator.get<AuthService>()));
  locator.registerFactory<SignUpController>(
      () => SignUpController(service: locator.get<AuthService>()));
}
