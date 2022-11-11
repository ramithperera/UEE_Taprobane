import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/auth_route.dart';
import 'package:uee_taprobane/controller/card_route.dart';
import 'package:uee_taprobane/controller/deliveryAddress_route.dart';
import 'package:uee_taprobane/custom/custom_confirm_dialog.dart';
import 'package:uee_taprobane/models/MerchantModel.dart';
import 'package:uee_taprobane/models/cardModel.dart';
import 'package:uee_taprobane/models/deliveryAddressModel.dart';
import 'package:uee_taprobane/models/deliveryPersonModel.dart';
import 'package:uee_taprobane/models/foriegnUserModel.dart';
import 'package:uee_taprobane/models/wholeSaleBuyerModel.dart';
import 'package:uee_taprobane/screens/ForiegnUser/Delivery_details_insert_screen.dart';
import 'package:uee_taprobane/screens/ForiegnUser/Delivery_details_update_screen.dart';
import 'package:uee_taprobane/screens/ForiegnUser/Payment%20Details_insert_screen.dart';
import 'package:uee_taprobane/screens/ForiegnUser/Payment_details_update_screen.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/screens/profile/edit_profile.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  CardModel card = CardModel();
  DeliveryAddressModel deliveryAddressModel = DeliveryAddressModel();

  DeliveryPersonModel deliveryPersonModel = DeliveryPersonModel();
  ForeignUserModel foreignUserModel = ForeignUserModel();
  WholeSaleBuyerModel wholeSaleBuyerModel = WholeSaleBuyerModel();
  MerchantModel merchantModel = MerchantModel();

  bool cardHave = false;
  bool addressHave = false;
  bool isDriver = false;
  bool isMerchant = false;
  bool isForeign = false;
  bool isWholesale = false;

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

  void getloggedUserPaymentDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res =
        await getCardDetailsOfLoggedCustomer(context, prefs.getString("_id"));
    print(res["card"].toString());
    setState(() {
      card = CardModel.fromJson(res["card"]);
      if (card.cardNum!.isNotEmpty) {
        cardHave = true;
      } else {
        cardHave = false;
      }
    });
  }

  // hgghj? asdsasd : asda? asdas: asd? asdasd: aasd

  void getloggedUserProfileDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res = await getUser(context, prefs.getString("_id"));
    print(res["user"].toString());
    setState(() {
      if (res["user"]["userRole"] == "delivery_person") {
        deliveryPersonModel = DeliveryPersonModel.fromJson(res["user"]);
        isDriver = true;
      }
      if (res["user"]["userRole"] == "foreign_user") {
        foreignUserModel = ForeignUserModel.fromJson(res["user"]);
        isForeign = true;
      }
      if (res["user"]["userRole"] == "wholesale_buyer") {
        wholeSaleBuyerModel = WholeSaleBuyerModel.fromJson(res["user"]);
        isWholesale = true;
      }
      if (res["user"]["userRole"] == "merchant") {
        merchantModel = MerchantModel.fromJson(res["user"]);
        isMerchant = true;
      }
    });
  }

  void getloggedUserDeliveryAddressDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res = await getDeliveryAddressDetailsOfLoggedCustomer(
        context, prefs.getString("_id"));
    print(res["DeliveryAddress"].toString());
    setState(() {
      deliveryAddressModel =
          DeliveryAddressModel.fromJson(res["DeliveryAddress"]);
      if (deliveryAddressModel.addressLine1!.isNotEmpty) {
        addressHave = true;
      } else {
        addressHave = false;
      }
    });
  }

  void cardDetailsEditNavigation() {
    if (cardHave == false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentDetailsInsert()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentDetailsUpdate()),
      );
    }
  }

  void deliveryDetailsEditNavigation() {
    if (addressHave == false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeliveryDetailsInsert()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeliveryDetailsUpdate()),
      );
    }
  }

  void deleteDeliveryDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res = await deleteDeliveryAddressDetailsOfLoggedCustomer(
        context, prefs.getString("_id"));
    showToastMessage('Delete Address Success!');
    Navigator.of(context).pop();
  }

  void deleteCardDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res = await deleteCardDetailsOfLoggedCustomer(
        context, prefs.getString("_id"));
    showToastMessage('Delete Card Success!');
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    getloggedUserPaymentDetails();
    getloggedUserDeliveryAddressDetails();
    getloggedUserProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              logoutfunc();
            },
          ),
          IconButton(
            onPressed: () {
              openPaymentAndDeliveyPopUp(context);
            },
            icon: const Icon(Icons.more_vert),
          ),
          const SizedBox(width: 20),
        ],
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
                addVerticalSpace(40),
                //detals container
                Container(
                  height: size.height * 0.3,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                          ),
                          Text(
                            isDriver
                                ? deliveryPersonModel.fullName!
                                : isForeign
                                    ? foreignUserModel.fullName!
                                    : isMerchant
                                        ? merchantModel.fullName!
                                        : isWholesale
                                            ? wholeSaleBuyerModel.fullName!
                                            : 'Balsamic',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                          ),
                          Text(
                            isDriver
                                ? deliveryPersonModel.email!
                                : isForeign
                                    ? foreignUserModel.email!
                                    : isMerchant
                                        ? merchantModel.email!
                                        : isWholesale
                                            ? wholeSaleBuyerModel.email!
                                            : 'Balsamic@gmail.com',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mobile',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                          ),
                          Text(
                            isDriver
                                ? deliveryPersonModel.mobileno!
                                : isForeign
                                    ? foreignUserModel.mobileno!
                                    : isMerchant
                                        ? merchantModel.mobileno!
                                        : isWholesale
                                            ? wholeSaleBuyerModel.mobileno!
                                            : '0719866423',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Location',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                          ),
                          Text(
                            isDriver
                                ? deliveryPersonModel.address!
                                : isForeign
                                    ? foreignUserModel.address!
                                    : isMerchant
                                        ? merchantModel.address!
                                        : isWholesale
                                            ? wholeSaleBuyerModel.address!
                                            : 'Dehiwala',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
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
                      minimumSize: Size(size.width * 0.8, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                addVerticalSpace(20),
                ElevatedButton(
                  onPressed: () {
                    confirmDialog();
                  },
                  child: Text(
                    'Delete Account',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 24.0,
                    )),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.8, 60),
                      backgroundColor: colorRed,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                addVerticalSpace(10)
              ],
            ),
          ),
        ),
      ),
    );
  }

  openPaymentAndDeliveyPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('My Payment & Delivery'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    cardDetailsEditNavigation();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(width: 3, color: Colors.black),
                      ),
                    ),
                  ),
                  child: Text('Payment Details'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    deliveryDetailsEditNavigation();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(width: 3, color: Colors.black),
                      ),
                    ),
                  ),
                  child: Text('Delivery Details'),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    deleteCardDetails();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(width: 3, color: Colors.red),
                      ),
                    ),
                  ),
                  child: Text('Delete Card'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    deleteDeliveryDetails();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(width: 2, color: Colors.red),
                      ),
                    ),
                  ),
                  child: Text('Delete Address'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        );
      },
    );
  }

  confirmDialog() {
    var baseDialog = CustomConfirmDialog(
      yesOnPressed: () {
        hideDialog(context);
        // cancelItem(orderLineModel);
        deleteUser();
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      noOnPressed: () {
        hideDialog(context);
      },
      title: 'Delete Acccount',
      message: 'Are you sure you want to delete account?',
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res = await userDelete(context, prefs.getString("_id"));
    if (res != null) {
      showToastMessage('Delete User Success!');
      Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}
