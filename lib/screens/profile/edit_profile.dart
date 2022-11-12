import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/auth_route.dart';
import 'package:uee_taprobane/models/MerchantModel.dart';
import 'package:uee_taprobane/models/deliveryPersonModel.dart';
import 'package:uee_taprobane/models/foriegnUserModel.dart';
import 'package:uee_taprobane/models/wholeSaleBuyerModel.dart';
import 'package:uee_taprobane/screens/DeliveryPerson/delivery_person_home.dart';
import 'package:uee_taprobane/screens/ForiegnUser/foriegn_user_home.dart';
import 'package:uee_taprobane/screens/Merchant/merchant_home.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/wholesale_buyer_home.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  DeliveryPersonModel deliveryPersonModel = DeliveryPersonModel();
  ForeignUserModel foreignUserModel = ForeignUserModel();
  WholeSaleBuyerModel wholeSaleBuyerModel = WholeSaleBuyerModel();
  MerchantModel merchantModel = MerchantModel();

  bool isDriver = false;
  bool isMerchant = false;
  bool isForeign = false;
  bool isWholesale = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void getloggedUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res = await getUser(context, prefs.getString("_id"));
    print(res["user"].toString());
    setState(() {
      if (res["user"]["userRole"] == "delivery_person") {
        deliveryPersonModel = DeliveryPersonModel.fromJson(res["user"]);
        nameController.text = deliveryPersonModel.fullName.toString();
        emailController.text = deliveryPersonModel.email.toString();
        phoneController.text = deliveryPersonModel.mobileno.toString();
        addressController.text = deliveryPersonModel.address.toString();
        isDriver = true;
      }
      if (res["user"]["userRole"] == "foreign_user") {
        foreignUserModel = ForeignUserModel.fromJson(res["user"]);
        nameController.text = foreignUserModel.fullName.toString();
        emailController.text = foreignUserModel.email.toString();
        phoneController.text = foreignUserModel.mobileno.toString();
        addressController.text = foreignUserModel.address.toString();
        isForeign = true;
      }
      if (res["user"]["userRole"] == "wholesale_buyer") {
        wholeSaleBuyerModel = WholeSaleBuyerModel.fromJson(res["user"]);
        nameController.text = wholeSaleBuyerModel.fullName.toString();
        emailController.text = wholeSaleBuyerModel.email.toString();
        phoneController.text = wholeSaleBuyerModel.mobileno.toString();
        addressController.text = wholeSaleBuyerModel.address.toString();
        isWholesale = true;
      }
      if (res["user"]["userRole"] == "merchant") {
        merchantModel = MerchantModel.fromJson(res["user"]);
        nameController.text = merchantModel.fullName.toString();
        emailController.text = merchantModel.email.toString();
        phoneController.text = merchantModel.mobileno.toString();
        addressController.text = merchantModel.address.toString();
        isMerchant = true;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getloggedUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.logout,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       logoutfunc();
        //     },
        //   )
        // ],
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                addVerticalSpace(30),
                Image.asset(
                  imagePath + "profile.png",
                  height: size.width * 0.7,
                ),
                addVerticalSpace(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Name",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: color33,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                          textAlign: TextAlign.left),
                    ),
                    addVerticalSpace(8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: "Please enter your Name",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Email",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: color33,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                          textAlign: TextAlign.left),
                    ),
                    addVerticalSpace(8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Mobile",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: color33,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                          textAlign: TextAlign.left),
                    ),
                    addVerticalSpace(8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: "Please enter your mobile",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Location",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: color33,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                          textAlign: TextAlign.left),
                    ),
                    addVerticalSpace(8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: "Please enter your location",
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
                  ],
                ),
                addVerticalSpace(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: color33,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0,
                        )),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(size.width * 0.2, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        updateUserDetails();
                      },
                      child: Text(
                        'Edit Profile',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: color33,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0,
                        )),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(size.width * 0.2, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateUserDetails() async {
    if (nameController.text.isEmpty) {
      showToastMessage('Name Cannot be empty!');
    }
    if (emailController.text.isEmpty) {
      showToastMessage('Email cannot be empty!');
    }
    if (phoneController.text.isEmpty) {
      showToastMessage('Mobile number cannot be empty!');
    }
    if (addressController.text.isEmpty) {
      showToastMessage('Location cannot be empty!');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String, String> body = {
        'fullName': nameController.text,
        'email': emailController.text,
        'mobileno': phoneController.text,
        'address': addressController.text,
      };

      print(body.toString());
      String id = prefs.getString("_id").toString();
      String? response = await userUpdate(context, body, id);
      print(response.toString());
      if (response != null) {
        showToastMessage('Update Success!');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (prefs.getString("userRole") == "wholesale_buyer") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WholeSaleBuyerHome()));
        }
        if (prefs.getString("userRole") == "foreign_user") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForignUserHome()));
        }
        if (prefs.getString("userRole") == "merchant") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MerchantHome()));
        }
        if (prefs.getString("userRole") == "delivery_person") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DeliveryPersonHome()));
        }
      } else {
        showToastMessage('Update failed.Try again!');
      }
    }
  }

  void logoutfunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("_id");
    prefs.remove("user");
    prefs.remove("token");
    prefs.remove("userRole");
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }
}
