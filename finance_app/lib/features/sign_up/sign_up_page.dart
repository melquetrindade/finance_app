import 'package:finance_app/common/constants/app_colos.dart';
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
                          labelText: "Nome"),
                      CustomTextField(
                          textEditingController: email,
                          textInputType: TextInputType.emailAddress,
                          hintText: "mariabenedita@gmail.com",
                          labelText: "Email",
                          textCapitalization: TextCapitalization.none),
                      CustomTextField(
                        obscureText: password,
                        textEditingController: passwordController,
                        textInputType: TextInputType.visiblePassword,
                        hintText: "********",
                        labelText: "Senha",
                        textCapitalization: TextCapitalization.none,
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
                                  : Icon(Icons.visibility_off))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: PrimaryButton(
                    text: 'Increva-se',
                    onPressed: () {
                      print('Cliquei no Sign Up');
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


/*

Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        child: TextFormField(
                          controller: name,
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "Maria Benedita",
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 81, 81, 81),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: "Nome".toUpperCase(),
                              labelStyle: TextStyle(
                                  color: const Color.fromARGB(255, 81, 81, 81),
                                  fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.greelightOne, width: 2)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.greelightOne,
                                      width: 2))),
                        ),
                      ),
 */