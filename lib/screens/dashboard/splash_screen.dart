//splashscreen here
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uee_taprobane/main.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: () {
          // _checkandnavigate();
        },
        child: Container(
          height: size.height,
          width: size.width,
          child: Center(
            child: Image.asset(
              imagePath + 'craftsman.png',
              width: 300,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, checkUser);
  }

  checkUser() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
          // settings: RouteSettings(arguments: user),
        ));
  }
}
