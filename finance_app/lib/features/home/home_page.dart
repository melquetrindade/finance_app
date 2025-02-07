import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _secureStorage = const SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home"),
          ElevatedButton(
              onPressed: () {
                _secureStorage.deleteOne(key: "CURRENT_USER").then((_) =>
                    Navigator.popAndPushNamed(context, NamedRoute.initial));
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
