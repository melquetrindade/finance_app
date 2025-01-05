import 'package:finance_app/common/constants/app_colos.dart';
import 'package:finance_app/utils/validator.dart';
import 'package:finance_app/widgets/custom_text_field.dart';
import 'package:finance_app/widgets/multi_text_button.dart';
import 'package:finance_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  bool password = true;
  bool password2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gaste de forma',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 36.0,
                      fontWeight: FontWeight.w800,
                      color: AppColors.greelightTwo),
                ),
                Text(
                  'mais inteligente',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 36.0,
                      fontWeight: FontWeight.w800,
                      color: AppColors.greelightTwo),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset('assets/images/sign_up_image.png'),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        textEditingController: name,
                        textInputType: TextInputType.name,
                        hintText: "Maria Benedita",
                        labelText: "Nome",
                        validator: Validator.validatorName,
                      ),
                      CustomTextField(
                        textEditingController: email,
                        textInputType: TextInputType.emailAddress,
                        hintText: "mariabenedita@gmail.com",
                        labelText: "Email",
                        textCapitalization: TextCapitalization.none,
                        validator: Validator.validatorEmail,
                      ),
                      CustomTextField(
                        obscureText: password,
                        textEditingController: passwordController,
                        textInputType: TextInputType.visiblePassword,
                        hintText: "********",
                        labelText: "Senha",
                        textCapitalization: TextCapitalization.none,
                        helperText: "Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número",
                        suffixIcon: InkWell(
                            onTap: () {
                              print("Trocar Incon de senha");
                              setState(() {
                                password = !password;
                              });
                            },
                            child: password == true
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Informe sua senha!";
                          } else if (value.length < 8) {
                            return "Sua senha deve ter no mínimo 8 caracteres!";
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        obscureText: password2,
                        textEditingController: passwordController2,
                        textInputType: TextInputType.visiblePassword,
                        hintText: "********",
                        labelText: "Confirme a senha",
                        textCapitalization: TextCapitalization.none,
                        suffixIcon: InkWell(
                            onTap: () {
                              print("Trocar Incon de confirmar senha");
                              setState(() {
                                password2 = !password2;
                              });
                            },
                            child: password2 == true
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirme sua senha!";
                          } else if (value.length < 8) {
                            return "Sua senha deve ter no mínimo 8 caracteres!";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: PrimaryButton(
                    text: 'Increva-se',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('prosseguir com o cadastro');
                      } else {
                        print('não processeguir');
                      }
                    },
                  ),
                ),
                MultiTextButton(
                    childrenTxt: [
                      Text(
                        'Já tem conta? ',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey),
                      ),
                      Text(
                        'Entrar',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greelightTwo),
                      ),
                    ],
                    onPressed: () {
                      print('Cliquei no Log in');
                    })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
