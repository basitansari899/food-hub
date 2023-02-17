import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Image.asset(
          "assets/splash_screen.png",
          fit: BoxFit.cover,
        ))
      ],
    ));
  }
}