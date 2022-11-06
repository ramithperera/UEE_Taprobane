


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/card_route.dart';
import 'package:uee_taprobane/controller/deliveryAddress_route.dart';
import 'package:uee_taprobane/controller/item_route.dart';
import 'package:uee_taprobane/custom/custom_success_screeen.dart';
import 'package:uee_taprobane/models/ItemModel.dart';
import 'package:uee_taprobane/models/cardModel.dart';
import 'package:uee_taprobane/models/deliveryAddressModel.dart';
import 'package:uee_taprobane/screens/ForiegnUser/Order_confirm_screen.dart';
import 'package:uee_taprobane/screens/ForiegnUser/foriegn_user_home.dart';
import 'package:uee_taprobane/screens/ForiegnUser/single_product_view.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/wholesale_buyer_home.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class OrderCompleteScreen extends StatefulWidget {  
  final int totalPrice;
  final String deliveryService;
  final String paymentMethod;
  final Key mapKey;

    const OrderCompleteScreen(
      {required this.totalPrice,
      required this.paymentMethod,
      required this.deliveryService,
      required this.mapKey})
      : super(key: mapKey);
      
  @override  
  _OrderCompleteScreenState createState() => _OrderCompleteScreenState();  
}  
  
class _OrderCompleteScreenState extends State<OrderCompleteScreen> {  



 
  String? selecteddeliveryService;
  String? selectedpaymentMethod;
  int? totalPrice;



  @override
  void initState() {
    super.initState();
    selecteddeliveryService = widget.deliveryService;
    selectedpaymentMethod = widget.paymentMethod;
    totalPrice = widget.totalPrice;
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
            title: const Text('Order Confirm'),  
            automaticallyImplyLeading: true,
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Container(
                  width: size.width,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child:  Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: size.width * 0.9,
                                    height: 300,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(211, 212, 211, 211),
                                        border: Border(),

                                    ),
                                    child: Image.asset("${imagePath}paymentsuccess.png"),                                          
                                    ),
                                ],
                              ),
                             
                            ],                        
                          ),
                        ),
                      ),
                  ]
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: size.width,
                  child: Column(
                    children: [
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10 , right: 10),
                          child:  Container(
                                width: size.width,
                                height: 40,
                                color: colorGreen,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                  "TOTAL PRICE : - " + "" +"" + totalPrice.toString(),
                                  style: TextStyle(
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold,
                                      color:Colors.white
                                      ),
                                ),
                              ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 50),
                          child:  Column(
                            children: [
                                                               const SizedBox(height:20),
                              Row(
                                children: [                          
                                  const Text(
                                    "SELECTED PAYMENT METHOD : - ",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       selectedpaymentMethod.toString(),
                                      style: const TextStyle(
                                          fontSize: 18, 
                                          color:colorGreen
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height:20),
                              Row(
                                    children: [                              
                                      const Text(
                                        "SELECTED DELIVERY METHOD : -",
                                        style:  TextStyle(
                                            fontSize: 18, 
                                            color:Colors.black                                              
                                        ),
                                      ),
                              
                                      Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          selecteddeliveryService.toString(),
                                          style: const TextStyle(
                                              fontSize: 18, 
                                              color:colorGreen
                                              ),
                                        ),
                                      ),
                                    ],
                              ),
                            const SizedBox(height:40),            
                            ],                        
                          ),
                        ),
                      ),
                  ]
                  ),
                ),
              ]
              ),
          ),
                bottomNavigationBar: Visibility(
        visible: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              //height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color:Color.fromARGB(255, 116, 115, 115).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  crossAxisAlignment: CrossAxisAlignment.center ,
                  children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child:Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: colorGreen,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              TextButton(                              
                                onPressed: ()=>{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WholeSaleBuyerHome()),
                                  )                                
                                }, 
                                child: const Text(
                                  "Order Complete...! Back To Home",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                            ),
                            ],
                          ),                      
                        ),
                      ),
                  ],
                ),
            ), 
          ],
        ),
      ),  
      );
  }  
}  

