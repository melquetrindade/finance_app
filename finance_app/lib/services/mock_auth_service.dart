import 'package:finance_app/common/models/user_model.dart';
import 'package:finance_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future signIn() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp(
      {String? name, required String email, required String password}) async {
        await Future.delayed(const Duration(seconds: 2));
    try {
      if (password.startsWith("123")) {
        throw Exception();
      }
      return UserModel(id: email.hashCode, name: name, email: email);
    } catch (e) {
      if (password.startsWith("123")) {
        throw "Senha insegura. Digite uma senha forte!";
      }
      throw "Não foi possível criar sua conta no momento. Tente mais tarde!";
    }
  }
}
