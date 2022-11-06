


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/card_route.dart';
import 'package:uee_taprobane/controller/item_route.dart';
import 'package:uee_taprobane/custom/custom_success_screeen.dart';
import 'package:uee_taprobane/models/ItemModel.dart';
import 'package:uee_taprobane/models/cardModel.dart';
import 'package:uee_taprobane/screens/ForiegnUser/Deliver_details_screen.dart';
import 'package:uee_taprobane/screens/ForiegnUser/single_product_view.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class DeliveryServiceSelectScreen extends StatefulWidget {  
  final ItemModel itemModel;
  final int quantity;
  final Key mapKey;

    const DeliveryServiceSelectScreen(
      {required this.itemModel,
      required this.quantity,
      required this.mapKey})
      : super(key: mapKey);
      
  @override  
  _DeliveryServiceSelectScreenState createState() => _DeliveryServiceSelectScreenState();  
}  
  
class _DeliveryServiceSelectScreenState extends State<DeliveryServiceSelectScreen> {  


  ItemModel item = ItemModel();
  int? quantity;
  String deliveryService = "";

  @override
  void initState() {
    item = widget.itemModel;
    quantity = widget.quantity;
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
            title: const Text('Select Delivery Service'),  
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
                                    height: 200,
                                    decoration: const BoxDecoration(
                                        color: colorGreen ,
                                        border: Border(),

                                    ),
                                    child: Image.asset("${imagePath}dservice.png"),                                          
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
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                  "Select Your Delivery Service",
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
                                  RadioListTile(
                                      title: Text("DHL"),
                                      value: "DHL", 
                                      groupValue: deliveryService, 
                                      onChanged: (value){
                                        setState(() {
                                            deliveryService = value.toString();
                                        });
                                      },
                                  ),

                                  RadioListTile(
                                      title: Text("FEDEX"),
                                      value: "FEDEX", 
                                      groupValue: deliveryService, 
                                      onChanged: (value){
                                        setState(() {
                                            deliveryService = value.toString();
                                        });
                                      },
                                  ),

                                  RadioListTile(
                                        title: Text("UPS"),
                                        value: "UPS", 
                                        groupValue: deliveryService, 
                                        onChanged: (value){
                                          setState(() {
                                              deliveryService = value.toString();
                                          });
                                        },
                                  ),

                                  RadioListTile(
                                      title: Text("PRONTO"),
                                      value: "PRONTO", 
                                      groupValue: deliveryService, 
                                      onChanged: (value){
                                        setState(() {
                                            deliveryService = value.toString();
                                        });
                                      },
                                  ),

                                  RadioListTile(
                                      title: Text("CERTISE LANKA COURIER SERVICE"),
                                      value: "CERTISE LANKA CURIOUR SERVICE", 
                                      groupValue: deliveryService, 
                                      onChanged: (value){
                                        setState(() {
                                            deliveryService = value.toString();
                                        });
                                      },
                                  ),

                                  RadioListTile(
                                        title: Text("AITKEN SPENCE EXPRESS"),
                                        value: "AITKEN SPENCE EXPRESS", 
                                        groupValue: deliveryService, 
                                        onChanged: (value){
                                          setState(() {
                                              deliveryService = value.toString();
                                          });
                                        },
                                  ),

                                  RadioListTile(
                                        title: Text("LOCAL RIDER"),
                                        value: "LOCAL RIDER", 
                                        groupValue: deliveryService, 
                                        onChanged: (value){
                                          setState(() {
                                              deliveryService = value.toString();
                                          });
                                        },
                                  )                         
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
                                  if(deliveryService == "")
                                  {
                                    showToastMessage("Please Select Delivery Service")
                                  }
                                  else
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => DeliveryDetailsScreen( itemModel: item, quantity: quantity as int , deliveryService: deliveryService ,  mapKey: UniqueKey(), )),
                                    )
                                  }                                
                                }, 
                                child: const Text(
                                  "Confirm Delivery Service",
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

