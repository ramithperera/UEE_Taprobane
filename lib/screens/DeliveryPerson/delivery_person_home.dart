import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/screens/DeliveryPerson/past_orders_screen.dart';
import 'package:uee_taprobane/screens/DeliveryPerson/upcomming_orders.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/screens/profile/profile_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';

class DeliveryPersonHome extends StatefulWidget {
  @override
  _DeliveryPersonHomeState createState() => _DeliveryPersonHomeState();
}

class _DeliveryPersonHomeState extends State<DeliveryPersonHome> {
  void goto(String page) {
    // if(page == "requsition")
    // {
    //    Navigator.push(
    //             context, MaterialPageRoute(builder: (context) => RequsitionHome()));
    // }
    // if(page == "orders")
    // {
    //    Navigator.push(
    //             context, MaterialPageRoute(builder: (context) => SiteOrderView()));
    // }
    // if(page == "invoices")
    // {
    //    Navigator.push(
    //             context, MaterialPageRoute(builder: (context) => ViewInvoiceHome()));
    // }
    // if(page == "payments")
    // {
    //    Navigator.push(
    //             context, MaterialPageRoute(builder: (context) => ViewPaymentHome()));
    // }
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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delivery Home',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              logoutfunc();
            },
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          width: size.width,
          height: size.height * 0.3,
          child: Center(
            child: Image.asset(
              imagePath + 'craftsman.png',
              width: 250,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //button column starts
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpcommingOrders()));
                  },
                  child: Text(
                    'View Upcomming Orders',
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
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PastOrdersScreen()));
                  },
                  child: Text(
                    'View Past Orders',
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: Text(
                    'Profile',
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
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
