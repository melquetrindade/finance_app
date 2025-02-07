//import 'package:finance_app/features/onboarding/onboarding_page.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/features/home/home_page.dart';
import 'package:finance_app/features/onboarding/onboarding_page.dart';
//import 'package:finance_app/features/sign_in/sign_in_controller.dart';
import 'package:finance_app/features/sign_in/sign_in_page.dart';
//import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/features/sign_up/sign_up_page.dart';
//import 'package:finance_app/features/sign_up/sign_up_page.dart';
import 'package:finance_app/features/splash/splash_page.dart';
import 'package:finance_app/firebase_options.dart';
import 'package:finance_app/locator.dart';
//import 'package:finance_app/services/mock_auth_service.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: NamedRoute.splash,
      routes: {
        NamedRoute.initial: (context) => const OnboardingPage(),
        NamedRoute.splash: (context) => const SplashPage(),
        NamedRoute.signUp: (context) => const SignUp(),
        NamedRoute.signIn: (context) => const SignIn(),
        NamedRoute.home: (context) => const HomePage()
      },
    );
  }
}
