//splashscreen here
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/main.dart';
import 'package:uee_taprobane/screens/DeliveryPerson/delivery_person_home.dart';
import 'package:uee_taprobane/screens/ForiegnUser/foriegn_user_home.dart';
import 'package:uee_taprobane/screens/Merchant/merchant_home.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/wholesale_buyer_home.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/screens/auth/register_selection_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   void _checkandnavigate()async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      String? userRole = prefs.getString("userRole");
      if(token!.isEmpty){
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => RegisterSelectionHome()));
      }
      else
      {
        if(userRole == "foreign_user")
        {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => ForignUserHome()));
        }
        if(userRole == "wholesale_buyer")
        {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => WholeSaleBuyerHome()));
        }
        if(userRole == "merchant")
        {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => MerchantHome()));
        }
        if(userRole == "delivery_person")
        {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => DeliveryPersonHome()));
        }
      }
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: () {
          _checkandnavigate();
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
    getLoggedUser().then((token) {
      if (token!.length > 0) {
        _checkandnavigate();        
      }
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterSelectionHome(),
            // settings: RouteSettings(arguments: user),
          ));
    });
  }
}
