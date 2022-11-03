//splashscreen here
import 'package:flutter/material.dart';
import 'package:uee_taprobane/main.dart';
import 'package:uee_taprobane/utils/constants.dart';

class SplashSCreen extends StatefulWidget {
  SplashSCreen({Key? key}) : super(key: key);

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
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
}
