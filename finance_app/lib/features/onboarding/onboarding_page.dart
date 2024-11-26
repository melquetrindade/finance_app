//import 'dart:math';
import 'package:finance_app/common/constants/app_colos.dart';
import 'package:finance_app/widgets/multi_text_button.dart';
import 'package:finance_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset('assets/images/man.png'),
              ),
            ),
            Container(
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Gaste de forma mais inteligente',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 36.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greelightTwo),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Economize mais',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greelightTwo),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: PrimaryButton(
                text: 'Começar',
                onPressed: () {
                  print('Apertei');
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: MultiTextButton(
                        childrenTxt: [
                          Text(
                            'Já tem conta? ',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey),
                          ),
                          Text(
                            'Conecte-se',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greelightTwo),
                          )
                        ],
                        onPressed: () {
                          print('cliquei no text button');
                        },
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            )
          ],
        ),
      ),
    );
  }
}
