
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';

class WholeSaleBuyerHome extends StatefulWidget {  
  @override  
  _WholeSaleBuyerHomeState createState() => _WholeSaleBuyerHomeState();  
}  
  
class _WholeSaleBuyerHomeState extends State<WholeSaleBuyerHome> {  


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
    Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LoginScreen(),));

  }


  @override  
  Widget build(BuildContext context) {  
      final Size size = MediaQuery.of(context).size;
    return Scaffold(       
          appBar: AppBar(  
            title: const Text('Whole Sale Home'),  
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
          body: Column(  
          children : [
              const SizedBox(height: 10,),
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
            const SizedBox(height: 50,),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       TextButton(
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 140, 255)),
          //         ),
          //         onPressed:()=>goto("requsition"),
          //         child: const Padding(
          //               padding:  EdgeInsets.only(left: 20,right: 20 , top: 10 , bottom: 10),
          //               child :Text(                                
          //                       'Requsitions',
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 20, 
          //                         //fontStyle: FontStyle.italic,
          //                         fontFamily: "calibr"
          //                         ),
          //                     ),
          //         ),
          //       ) ,
          //     ],
          // ),
          // const SizedBox(height: 30,),
          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       TextButton(                                    
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 140, 255)),                    
          //         ),
          //         onPressed:()=>goto("orders"),
          //         child:const Padding(
          //               padding: EdgeInsets.only(left: 40,right: 40 , top: 10 , bottom: 10),
          //               child :Text(
          //                       'Orders',
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 20, 
          //                         //fontStyle: FontStyle.italic,
          //                         fontFamily: "calibr"
          //                         ),
          //                     ),
          //         ),
          //       ) 
          //     ],
          // ),
          // const SizedBox(height: 30,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     TextButton(
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 140, 255)),
          //       ),
          //       onPressed:()=>goto("invoices"),
          //       child:const Padding(
          //               padding:  EdgeInsets.only(left: 35,right: 35 , top: 10 , bottom: 10),
          //               child :Text(
          //                       'Invoices',

          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 20, 
          //                         //fontStyle: FontStyle.italic,
          //                         fontFamily: "calibr"
          //                         ),
          //                     ),
          //         ),        
          //     ) , 
          //   ],
          // ),
          // const SizedBox(height: 30,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     TextButton(                
          //       style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 140, 255)),
          //       ),
          //       onPressed:()=>goto("payments"),
          //       child:const Padding(
          //               padding: EdgeInsets.only(left: 27,right: 27 , top: 10 , bottom: 10),
          //               child :Text(
          //                       'Payments',
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 20, 
          //                         //fontStyle: FontStyle.italic,
          //                         fontFamily: "calibr"
          //                         ),
          //                     ),
          //         ),        
          //     ) 
          //   ],
          // ),  
          ] 
        ),  
      );
  }  
}  