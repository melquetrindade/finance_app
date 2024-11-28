import 'package:finance_app/common/constants/app_colos.dart';
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
                  child: TextFormField(),
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
