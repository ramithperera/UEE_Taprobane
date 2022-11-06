import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/screens/Merchant/add_handycraft.dart';
import 'package:uee_taprobane/screens/Merchant/order_list.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class MerchantHome extends StatefulWidget {
  @override
  _MerchantHomeState createState() => _MerchantHomeState();
}

class _MerchantHomeState extends State<MerchantHome> {
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
          'Merchant Home',
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
          height: 50,
        ),
        //button column starts
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'View Handicrafts',
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
                            builder: (context) => AddHandycraft()));
                  },
                  child: Text(
                    'Add new handicraft',
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
                            builder: (context) => OrderListScreen()));
                  },
                  child: Text(
                    'View order list',
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
                  onPressed: () {},
                  child: Text(
                    'Sign out',
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
