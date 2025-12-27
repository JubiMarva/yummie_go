import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yammiego/View/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // clean & elegant
      body: Center(
        child: Image.asset(
          'assets/splash_yummie_go.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
