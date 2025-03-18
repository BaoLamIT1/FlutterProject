import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice_firebase/Login%20Sigup/Screen/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}
class _SplashScreen extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 1), () {  // Hiển thị Splash Screen trong 1s
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}