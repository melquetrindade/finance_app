import 'dart:async';
import 'package:finance_app/common/constants/app_colos.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Timer init() {
    return Timer(Duration(seconds: 2), navigateToOnboarding);
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(
        context, NamedRoute.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.greelightOne, AppColors.greelightTwo])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Finanças',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            CircularProgressIndicator(
              color: AppColors.iceWhite,
            )
          ],
        ),
      ),
    );
  }
}
