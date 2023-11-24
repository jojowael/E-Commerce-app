import 'dart:async';

import 'package:flutter/material.dart';

import '../auth/Login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/img.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
