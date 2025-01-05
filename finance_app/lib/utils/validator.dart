class Validator {
  Validator._();

  static String? validatorName(String? value) {
    final condition = RegExp(r"^[a-zA-ZáÁéÉíÍóÓúÚâÂêÊîÎôÔûÛãÃõÕçÇäÄëËïÏöÖüÜàÀèÈìÌòÒùÙñÑ]+$");
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
    } else if (condition.hasMatch(value) == false) {
      return "E-mail inválido, tente novamente!";
    }
    return null;
  }

  static String? validatorSenha(String? value) {
    final condition =
        RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
    if (value!.isEmpty) {
      return "Informe sua senha!";
    } else if (value.length < 8) {
      return "Sua senha deve ter no mínimo 8 caracteres!";
    } else if (condition.hasMatch(value) == false) {
      return "Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número";
    }
    return null;
  }

  static String? validatorConfirmeSenha(String? first, String? second) {
    if (first != second) {
      return "Error, as senhas são diferentes!";
    }
    return null;
  }
}
