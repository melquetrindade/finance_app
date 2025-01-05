class Validator {
  Validator._();

  static String? validatorName(String? value) {
    final condition = RegExp(r'^[a-zA-Z]+$');
    if (value!.isEmpty) {
      return "Informe o nome corretamente!";
    } else if (condition.hasMatch(value) == false) {
      return "Nome inválido, tente novamente!";
    }
    return null;
  }

  static String? validatorEmail(String? value) {
    final condition = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (value!.isEmpty) {
      return "Informe o e-mail corretamente!";
    } else if(condition.hasMatch(value) == false){
      return "E-mail inválido, tente novamente!";
    }
    return null;
  }

  static String? validatorSenha(String? value) {
    if (value!.isEmpty) {
      return "Informe sua senha!";
    } else if (value.length < 8) {
      return "Sua senha deve ter no mínimo 8 caracteres!";
    }
    return null;
  }

  static String? validatorConfirmeSenha(String? value) {
    if (value!.isEmpty) {
      return "Confirme sua senha!";
    } else if (value.length < 8) {
      return "Sua senha deve ter no mínimo 8 caracteres!";
    }
    return null;
  }
}
