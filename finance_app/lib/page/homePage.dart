import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Home Page',
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500),
          ),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}