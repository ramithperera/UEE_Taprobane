import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uee_taprobane/controller/auth_route.dart';
import 'package:uee_taprobane/models/logged_user.dart';
import 'package:uee_taprobane/screens/DeliveryPerson/delivery_person_home.dart';
import 'package:uee_taprobane/screens/ForiegnUser/foriegn_user_home.dart';
import 'package:uee_taprobane/screens/Merchant/merchant_home.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/wholesale_buyer_home.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class WholeSaleBuyerSignup extends StatefulWidget {
  WholeSaleBuyerSignup({Key? key}) : super(key: key);

  @override
  State<WholeSaleBuyerSignup> createState() => _WholeSaleBuyerSignupState();
}

class _WholeSaleBuyerSignupState extends State<WholeSaleBuyerSignup> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  bool showPassword = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobilenoController.text = "+94";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Customer Signup"),
      ),
      bottomNavigationBar:Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                register();
              },
              child: Container(
                height: 50,
                width: size.width * 0.7,
                child:  const Center(

                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
             ),
      ),
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
                            controller: fullNameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Full Name",
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
                            controller: mobilenoController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Mobile Number",
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
                            controller: dateOfBirthController,
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Date Of Birth",
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
                            controller: addressController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Address",
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
                            controller: confirmpasswordController,
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
                              hintText: "Please enter your password again",
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
                                    "Already have an account Login Here ? Login In",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                    ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  LoginScreen(),
                          ),
                        );
                      
                      } ,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void register() async {
    if (!validateEmail(emailController.text)) {
      showToastMessage('Enter valid email!');
    }
    if (fullNameController.text.isEmpty) {
      showToastMessage('Full Name cannot be empty!');
    }
    if (mobilenoController.text.isEmpty) {
      showToastMessage('Mobile Number cannot be empty!');
    }
    if (dateOfBirthController.text.isEmpty) {
      showToastMessage('BirthDay cannot be empty!');
    }
    if (addressController.text.isEmpty) {
      showToastMessage('Address cannot be empty!');
    }
    if (passwordController.text.isEmpty) {
      showToastMessage('Password cannot be empty!');
    }
    if (confirmpasswordController.text.isEmpty) {
      showToastMessage('Confirm Password cannot be empty!');
    }
    if (passwordController.text != confirmpasswordController.text) {
      showToastMessage('Password doesnot match!');
    }
    else
    {
      Map<String, String> body = {
        'email': emailController.text,
        'password': passwordController.text,
        'fullName': fullNameController.text,
        'mobileno': mobilenoController.text,
        'dateOfBirth': dateOfBirthController.text,
        'address': addressController.text,
        'userRole':"wholesale_buyer",
      };

      String? response = await userRegister(context, body);
      // print("response print");
      // print(response);
      if (response != null) {
        var loggedUser = LoggedUser.fromJson(jsonDecode(response));
        showToastMessage('Register Success!');
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
        showToastMessage('Register failed.Try again!');
      }
    }
  }
}
