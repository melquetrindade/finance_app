import 'package:finance_app/common/constants/app_colos.dart';
import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:finance_app/utils/validator.dart';
import 'package:finance_app/widgets/custom_text_field.dart';
import 'package:finance_app/widgets/multi_text_button.dart';
import 'package:finance_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SignUpController signUpController;

  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  bool password = true;
  bool password2 = true;

  @override
  void initState() {
    super.initState();
    signUpController = context.read<SignUpController>();

    signUpController.addListener(() {
      if (signUpController.state is SignUpLoadingState) {
        _myShowDialog();
      }
      if (signUpController.state is SignUpSuccessState) {
        Navigator.of(context).pop();
      }
      if (signUpController.state is SignUpErrorState) {
        _myShowModalBottomSheet();
      }
    });
  }

  void _myShowModalBottomSheet() {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Ops. Algo deu errado"),
                  PrimaryButton(
                    text: "Tente Novamente", 
                    onPressed: () => Navigator.pop(context),)
                ],
              ),
            ),
          );
        });
  }

  void _myShowDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    signUpController = context.watch<SignUpController>();

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
                        helperText:
                            "Deve ter pelo menos 8 caracteres, 1 letra maiúscula e 1 número",
                        suffixIcon: inkWellSenha(),
                        validator: Validator.validatorSenha,
                      ),
                      CustomTextField(
                        obscureText: password2,
                        textEditingController: passwordController2,
                        textInputType: TextInputType.visiblePassword,
                        hintText: "********",
                        labelText: "Confirme a senha",
                        textCapitalization: TextCapitalization.none,
                        suffixIcon: inkWellConfirmeSenha(),
                        validator: (value) => Validator.validatorConfirmeSenha(
                            value, passwordController.text),
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
                        signUpController.doSignUp();
                      } else {
                        signUpController.doSignUp();
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

  InkWell inkWellConfirmeSenha() {
    return InkWell(
        onTap: () {
          setState(() {
            password2 = !password2;
          });
        },
        child: password2 == true
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off));
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
