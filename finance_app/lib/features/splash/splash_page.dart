import 'package:finance_app/common/constants/app_colos.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/features/splash/splash_controller.dart';
import 'package:finance_app/features/splash/splash_state.dart';
import 'package:finance_app/locator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashSuccessState) {
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      } else {
        Navigator.pushReplacementNamed(context, NamedRoute.initial);
      }
    });
    //init();
    super.initState();
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }
  /*
  Timer init() {
    return Timer(Duration(seconds: 2), navigateToOnboarding);
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(context, NamedRoute.initial);
  }*/

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
