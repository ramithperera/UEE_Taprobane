import 'package:flutter/material.dart';
import 'package:uee_taprobane/screens/dashboard/splash_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taprobane',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: SplashScreen(),
    );
  }
}

const MaterialColor primaryColor = MaterialColor(0xff52b788, <int, Color>
{
  50:colorGreen3,
  100:colorGreen3,
  200:colorGreen3,
  300:colorGreen3,
  400:colorGreen3,
  500:colorGreen3,
  600:colorGreen3,
  700:colorGreen3,
  800:colorGreen3,
  900:colorGreen3,
});
