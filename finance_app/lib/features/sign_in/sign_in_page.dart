import 'package:finance_app/common/constants/app_colos.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/features/sign_in/sigan_in_state.dart';
import 'package:finance_app/features/sign_in/sign_in_controller.dart';
import 'package:finance_app/locator.dart';
import 'package:finance_app/utils/validator.dart';
import 'package:finance_app/widgets/custom_text_field.dart';
import 'package:finance_app/widgets/multi_text_button.dart';
import 'package:finance_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signInController = locator.get<SignInController>();

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final passwordController = TextEditingController();

  bool password = true;

  @override
  void dispose() {
    email.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    signInController.addListener(() {
      if (signInController.state is SignInLoadingState) {
        _myShowDialog();
      }
      if (signInController.state is SignInSuccessState) {
        Navigator.of(context).pop();
      }
      if (signInController.state is SignInErrorState) {
        final error = signInController.state as SignInErrorState;
        Navigator.of(context).pop();

        _myShowModalBottomSheet(error.message);
      }
    });
  }

  void _myShowModalBottomSheet(String messageError) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38), topRight: Radius.circular(38)),
        ),
        builder: (BuildContext) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(38), topRight: Radius.circular(38)),
            ),
            height: 200,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(messageError,
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greelightTwo),
                    ),
                    PrimaryButton(
                      text: "Tente Novamente",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _myShowDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.iceWhite,
            ),
          );
        });
  }

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
                  'Bem vindo de volta',
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
                        helperText:
                            "Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número",
                        suffixIcon: inkWellSenha(),
                        validator: Validator.validatorSenha,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: PrimaryButton(
                    text: 'Entrar',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('prosseguir com o cadastro');
                        signInController.signIn(
                            email: email.text,
                            password: passwordController.text);
                      } else {
                        print('não processeguir');
                      }
                    },
                  ),
                ),
                MultiTextButton(
                    childrenTxt: [
                      Text(
                        'Não tenho conta? ',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grey),
                      ),
                      Text(
                        'Inscrever-se',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greelightTwo),
                      ),
                    ],
                    onPressed: () => Navigator.popAndPushNamed(context, NamedRoute.signUp))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  InkWell inkWellSenha() {
    return InkWell(
        onTap: () {
          setState(() {
            password = !password;
          });
        },
        child: password == true
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off));
  }
}
