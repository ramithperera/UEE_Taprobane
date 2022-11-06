import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/auth_route.dart';
import 'package:uee_taprobane/controller/card_route.dart';
import 'package:uee_taprobane/controller/deliveryAddress_route.dart';
import 'package:uee_taprobane/models/deliveryAddressModel.dart';
import 'package:uee_taprobane/models/logged_user.dart';
import 'package:uee_taprobane/screens/DeliveryPerson/delivery_person_home.dart';
import 'package:uee_taprobane/screens/ForiegnUser/foriegn_user_home.dart';
import 'package:uee_taprobane/screens/Merchant/merchant_home.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/wholesale_buyer_home.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class DeliveryDetailsUpdate extends StatefulWidget {
  DeliveryDetailsUpdate({Key? key}) : super(key: key);

  @override
  State<DeliveryDetailsUpdate> createState() => _DeliveryDetailsUpdateState();
}

class _DeliveryDetailsUpdateState extends State<DeliveryDetailsUpdate> {

  TextEditingController mobilenoController = TextEditingController();
  TextEditingController addressLineTwoController = TextEditingController();
  TextEditingController addressLineOneController = TextEditingController();

  DeliveryAddressModel deliveryAddressModel = DeliveryAddressModel();


   void getloggedUserDeliveryAddressDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res =  await getDeliveryAddressDetailsOfLoggedCustomer(context,prefs.getString("_id"));
    print(res["DeliveryAddress"].toString());
    setState(() {
      deliveryAddressModel = DeliveryAddressModel.fromJson(res["DeliveryAddress"]);
      mobilenoController.text = deliveryAddressModel.mobileno.toString();
      addressLineOneController.text = deliveryAddressModel.addressLine1.toString();
      addressLineTwoController.text = deliveryAddressModel.addressLine2.toString();
    });

  }

  @override
  void initState() {
    super.initState();
    getloggedUserDeliveryAddressDetails();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Update Delivery Address "),
      ),
      bottomNavigationBar:Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                updateDeliveryAddress();
              },
              child: Container(
                height: 50,
                width: size.width * 0.7,
                child:  const Center(

                  child: Text(
                    "Update Address",
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
                            controller: addressLineOneController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Address Line 1",
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
                            controller: addressLineTwoController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please Enter ypur Address Line 2",
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
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Mobile number",
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
                ],
              ),
            ),
          )),
    );
  }

  void updateDeliveryAddress() async {
    if (mobilenoController.text.isEmpty) {
      showToastMessage('Enter valid Card Number!');
    }
    if (addressLineTwoController.text.isEmpty) {
      showToastMessage('Card Type cannot be empty!');
    }
    if (addressLineOneController.text.isEmpty) {
      showToastMessage('Card Holder Name cannot be empty!');
    }
    else
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String, String> body = {
        'addressLine1': addressLineOneController.text,
        'addressLine2': addressLineTwoController.text,
        'mobileno': mobilenoController.text,
        'address_owner':prefs.getString("_id").toString(),
      };
      String id = prefs.getString("_id").toString();
      String? response = await userAddressUpdate(context, body,id);
      print(response.toString());
      if (response != null) {
        showToastMessage('Update Address Success!');
      
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
