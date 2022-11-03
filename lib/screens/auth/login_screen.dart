import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uee_taprobane/controller/auth_route.dart';
import 'package:uee_taprobane/models/logged_user.dart';
import 'package:uee_taprobane/screens/DeliveryPerson/delivery_person_home.dart';
import 'package:uee_taprobane/screens/ForiegnUser/foriegn_user_home.dart';
import 'package:uee_taprobane/screens/Merchant/merchant_home.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/wholesale_buyer_home.dart';
import 'package:uee_taprobane/screens/auth/register_selection_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(0),
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  addVerticalSpace(60),
                  Image.asset(
                    iconPath + 'ic_login.png',
                    width: 250,
                  ),
                  addVerticalSpace(10),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  addVerticalSpace(30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffc4c2c2),
                              offset: Offset(0, 0),
                              spreadRadius: 1,
                              blurRadius: 10,
                              blurStyle: BlurStyle.normal,
                            )
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your email",
                              // labelText: "Email address",
                              border: InputBorder.none,
                              // labelStyle: TextStyle(
                              //   color: colorOrange
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffc4c2c2),
                              offset: Offset(0, 0),
                              spreadRadius: 1,
                              blurRadius: 10,
                              blurStyle: BlurStyle.normal,
                            )
                          ]),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !showPassword,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                              ),
                              hintText: "Please enter your password",
                              // labelText: "Email address",
                              border: InputBorder.none,
                              // labelStyle: TextStyle(
                              //   color: colorOrange
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  addVerticalSpace(20),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextButton(
                      child:const Text(
                                    "New to the App Sign up From Here ? Sign Up",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                    ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  RegisterSelectionHome(),
                          ),
                        );
                      
                      } ,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: Container(
                        height: 50,
                        width: size.width * 0.7,
                        child: Center(
                          // widthFactor: size.width * 0.013,
                          child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void login() async {
    if (!validateEmail(emailController.text)) {
      showToastMessage('Enter valid email!');
    }
    if (passwordController.text.isEmpty) {
      showToastMessage('Password cannot be empty!');
    }
    else
    {
      Map<String, String> body = {
        "email": emailController.text,
        "password": passwordController.text
      };

      String? response = await userLogin(context, body);
      // print("response print");
      // print(response);
      if (response != null) {
        var loggedUser = LoggedUser.fromJson(jsonDecode(response));
        showToastMessage('Login Success!');
        saveLoggedUser(loggedUser.data);
        if(loggedUser.data!.userRole == "foreign_user")
        {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => ForignUserHome()));
        }
        if(loggedUser.data!.userRole == "wholesale_buyer")
        {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => WholeSaleBuyerHome()));
        }
        if(loggedUser.data!.userRole == "merchant")
        {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => MerchantHome()));
        }
        if(loggedUser.data!.userRole == "delivery_person")
        {
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => DeliveryPersonHome()));
        }
      }
      else
      {
        showToastMessage('Login failed.Try again!');
      }
    }
  }
}
