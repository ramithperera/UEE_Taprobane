


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/item_route.dart';
import 'package:uee_taprobane/models/ItemModel.dart';
import 'package:uee_taprobane/screens/ForiegnUser/payment_confirm_screen.dart';
import 'package:uee_taprobane/screens/ForiegnUser/single_product_view.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class WholeSaleCartScreen extends StatefulWidget {  
  final ItemModel itemModel;
  final int quantity;
  final Key mapKey;

    const WholeSaleCartScreen(
      {required this.itemModel,
      required this.quantity,
      required this.mapKey})
      : super(key: mapKey);
      
  @override  
  _WholeSaleCartScreenState createState() => _WholeSaleCartScreenState();  
}  
  
class _WholeSaleCartScreenState extends State<WholeSaleCartScreen> {  


  ItemModel item = ItemModel();
  int? quantity;
  int? total;


  @override
  void initState() {
    item = widget.itemModel;
    quantity = widget.quantity;
    String onlyPrice = item.unit_price!.substring(1);
    int price = int.parse(onlyPrice);
    total  = price * widget.quantity;
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
            title: const Text('Cart'),  
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
                     const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child:  Text(
                            "Selected Item",
                            style: TextStyle(
                                fontSize: 20, 
                                fontWeight: FontWeight.bold,
                                color:colorGreen
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
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
                                        height: 200,
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
                                  padding:const EdgeInsets.all(10),
                                  child: Text(
                                  "Final Price",
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
                              Row(
                                children: [
                                  const SizedBox(width: 30),
                                  const Text(
                                    "Total price : -",
                                    style:  TextStyle(
                                        fontSize: 25, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                       "\$"+total.toString(),
                                      style: const TextStyle(
                                          fontSize: 25, 
                                          fontWeight: FontWeight.bold,
                                          color:colorGreen
                                          ),
                                    ),
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
                                    MaterialPageRoute(builder: (context) => PaymentConfirmScreen( itemModel: item, quantity: quantity as int ,  mapKey: UniqueKey(), )),
                                  )                               
                                }, 
                                child: const Text(
                                  "Proceed to Pay",
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

