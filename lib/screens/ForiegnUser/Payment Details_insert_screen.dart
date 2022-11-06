import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/auth_route.dart';
import 'package:uee_taprobane/controller/card_route.dart';
import 'package:uee_taprobane/models/logged_user.dart';
import 'package:uee_taprobane/screens/DeliveryPerson/delivery_person_home.dart';
import 'package:uee_taprobane/screens/ForiegnUser/foriegn_user_home.dart';
import 'package:uee_taprobane/screens/Merchant/merchant_home.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/wholesale_buyer_home.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class PaymentDetailsInsert extends StatefulWidget {
  PaymentDetailsInsert({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsInsert> createState() => _PaymentDetailsInsertState();
}

class _PaymentDetailsInsertState extends State<PaymentDetailsInsert> {

  TextEditingController cardNumController = TextEditingController();
  TextEditingController ctypeController = TextEditingController();
  TextEditingController holderController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController cvvController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add New Card Details"),
      ),
      bottomNavigationBar:Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                insertpaymentcard();
              },
              child: Container(
                height: 50,
                width: size.width * 0.7,
                child:  const Center(

                  child: Text(
                    "Add New Card",
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
                            controller: ctypeController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Card Type ( VISA / MASTER )",
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
                            controller: holderController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please Card Holder Name",
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
                            controller: cardNumController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Card Number",
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
                            controller: yearController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Card Year ",
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
                            controller: monthController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Card Month",
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
                            controller: cvvController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your CVV",
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
                ],
              ),
            ),
          )),
    );
  }

  void insertpaymentcard() async {
    if (cardNumController.text.isEmpty) {
      showToastMessage('Enter valid Card Number!');
    }
    if (ctypeController.text.isEmpty) {
      showToastMessage('Card Type cannot be empty!');
    }
    if (holderController.text.isEmpty) {
      showToastMessage('Card Holder Name cannot be empty!');
    }
    if (yearController.text.isEmpty) {
      showToastMessage('Year cannot be empty!');
    }
    if (monthController.text.isEmpty) {
      showToastMessage('Month cannot be empty!');
    }
    if (cvvController.text.isEmpty) {
      showToastMessage('CVV cannot be empty!');
    }
    else
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String, String> body = {
        'cardNum': cardNumController.text,
        'ctype': ctypeController.text,
        'holder': holderController.text,
        'year': yearController.text,
        'month': monthController.text,
        "cvv":cvvController.text,
        'card_Owner':prefs.getString("_id").toString(),
      };

      String? response = await userCardInsert(context, body);
      if (response != null) {
        showToastMessage('Add New Card Success!');
      
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => ForignUserHome()));

      }
      else
      {
        showToastMessage('Register failed.Try again!');
      }
    }
  }
}
