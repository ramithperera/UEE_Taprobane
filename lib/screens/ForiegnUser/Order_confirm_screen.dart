


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
import 'package:uee_taprobane/screens/ForiegnUser/Delivery_service_select_screen.dart';
import 'package:uee_taprobane/screens/ForiegnUser/Order_complete_screen.dart';
import 'package:uee_taprobane/screens/ForiegnUser/single_product_view.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class OrderConfirmScreen extends StatefulWidget {  
  final ItemModel itemModel;
  final int quantity;
  final String deliveryService;
  final Key mapKey;

    const OrderConfirmScreen(
      {required this.itemModel,
      required this.quantity,
      required this.deliveryService,
      required this.mapKey})
      : super(key: mapKey);
      
  @override  
  _OrderConfirmScreenState createState() => _OrderConfirmScreenState();  
}  
  
class _OrderConfirmScreenState extends State<OrderConfirmScreen> {  


  ItemModel item = ItemModel();
  int? quantity;
  int? total;
  CardModel card = CardModel();
  String userName = "";
  String? deliveryService;
  DeliveryAddressModel deliveryAddressModel = DeliveryAddressModel();
  int? deliveryChargers;
  int? subTotal;

 void getloggedUserPaymentDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res =  await getCardDetailsOfLoggedCustomer(context,prefs.getString("_id"));
    print(res["card"].toString());
    setState(() {
      card = CardModel.fromJson(res["card"]);
      userName = prefs.getString("user")!;
    });

  }




   void getloggedUserDeliveryAddressDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res =  await getDeliveryAddressDetailsOfLoggedCustomer(context,prefs.getString("_id"));
    print(res["DeliveryAddress"].toString());
    setState(() {
      deliveryAddressModel = DeliveryAddressModel.fromJson(res["DeliveryAddress"]);
    });

  }

  @override
  void initState() {
    item = widget.itemModel;
    quantity = widget.quantity;
    deliveryService = widget.deliveryService;
    String onlyPrice = item.unit_price!.substring(1);
    int price = int.parse(onlyPrice);
    total  = price * widget.quantity;
    deliveryChargers = 50;
    subTotal = total! + deliveryChargers!;
    getloggedUserPaymentDetails();
    getloggedUserDeliveryAddressDetails();
    super.initState();
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
            title: const Text('Confirm Order'),  
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
                      Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 50),
                          child:  Column(
                            children: [
                                  Row(
                                    children: [
                              
                                      const Text(
                                        "User Name : -",
                                        style:  TextStyle(
                                            fontSize: 18, 
                                            fontWeight: FontWeight.bold,
                                            color:Colors.black                                              
                                        ),
                                      ),
                              
                                      Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          userName.toString(),
                                          style: const TextStyle(
                                              fontSize: 18, 
                                              fontWeight: FontWeight.bold,
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
                                    "Address Line One : -",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       deliveryAddressModel.addressLine1.toString(),
                                      style: const TextStyle(
                                          fontSize: 18, 
                                          fontWeight: FontWeight.bold,
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
                                    "Address Line 2 : -",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Expanded(child: Text(
                                       deliveryAddressModel.addressLine2.toString(),
                                      style: const TextStyle(
                                          fontSize: 18, 
                                          fontWeight: FontWeight.bold,
                                          color:colorGreen
                                          ),
                                    ),)
                                  ),
                                ],
                              ),
                              const SizedBox(height:20),
                              Row(
                                children: [
                          
                                  const Text(
                                    "User Mobile Number : -",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Expanded(child: Text(
                                       deliveryAddressModel.mobileno.toString(),
                                      style: const TextStyle(
                                          fontSize: 18, 
                                          fontWeight: FontWeight.bold,
                                          color:colorGreen
                                          ),
                                    ),)
                                  ),
                                ],
                              ),                                                 
                            ],                        
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 10 , right: 10),
                          child:  Container(
                                width: size.width,
                                height: 40,
                                color: colorGreen,
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                  "ORDER DETAILS",
                                  style: TextStyle(
                                      fontSize: 20, 
                                      color:Colors.black
                                      ),
                                ),
                              ),
                          ),
                        ),
                      ),
                      Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child:  Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 150,
                                        decoration: const BoxDecoration(
                                            //backgroundBlendMode:  ,
                                            border: Border(),

                                        ),
                                        child: Image.asset("${imagePath}noimage.gif"),                                          
                                        ),
                                    ],                                  
                                  ),
                                  Column(
                                    children : [
                                      Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          item.name.toString(),
                                          style: const TextStyle(
                                              fontSize: 20, 
                                              fontWeight: FontWeight.bold,
                                              color:Colors.black
                                              ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Price : " + item.unit_price.toString(),
                                          style: const TextStyle(
                                              fontSize: 20, 
                                              fontWeight: FontWeight.bold,
                                              color:Colors.black
                                              ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "quantity : " + quantity.toString(),
                                          style: const TextStyle(
                                              fontSize: 20, 
                                              fontWeight: FontWeight.bold,
                                              color:Colors.black
                                              ),
                                        ),
                                      ),
                                    ]
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
                const SizedBox(height: 20),
                  Container(
                  width: size.width,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 50),
                          child:  Column(
                            children: [
                              Row(
                                children: [                          
                                  const Text(
                                    "SUB TOTAL PRICE : - ",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       "\$"+total.toString(),
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
                                    "Delivery Charges : - ",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        color:Colors.black                                              
                                    ),
                                  ),                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       "\$"+deliveryChargers.toString(),
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
                                    "TOTAL PRICE : - ",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       "\$"+subTotal.toString(),
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
                                    "SELECTED PAYMENT METHOD : - ",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       card.ctype.toString(),
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
                                          deliveryService.toString(),
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
                          width: MediaQuery.of(context).size.width * 0.5,
                          color: colorGreen,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: 10),
                              TextButton(                              
                                onPressed: ()=>{
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => OrderCompleteScreen(quantity: quantity as int, item:item, totalPrice: subTotal as int, deliveryService: deliveryService as String , paymentMethod :card.ctype.toString() ,  mapKey: UniqueKey(), )),
                                  )                                
                                }, 
                                child: const Text(
                                  "Pay Now",
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

