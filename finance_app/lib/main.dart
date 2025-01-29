//import 'package:finance_app/features/onboarding/onboarding_page.dart';
import 'package:finance_app/features/sign_up/sign_up_controller.dart';
//import 'package:finance_app/features/sign_up/sign_up_page.dart';
import 'package:finance_app/features/splash/splash_page.dart';
import 'package:finance_app/services/mock_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => SignUpController(service: MockAuthService()),
  child: MyApp(),
  ));
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
      home: SplashPage()
    );
  }
}
