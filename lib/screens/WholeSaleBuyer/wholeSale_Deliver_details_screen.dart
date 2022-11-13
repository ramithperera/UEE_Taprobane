
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/deliveryAddress_route.dart';
import 'package:uee_taprobane/models/ItemPackageModel.dart';
import 'package:uee_taprobane/models/deliveryAddressModel.dart';
import 'package:uee_taprobane/screens/ForiegnUser/Delivery_details_update_screen.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/WholeSale_Order_confirm_screen.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';


class WholesaleDeliveryDetailsScreen extends StatefulWidget {  
  final ItemPackageModel itemModel;
  final int quantity;
  final String deliveryService;
  final Key mapKey;

    const WholesaleDeliveryDetailsScreen(
      {required this.itemModel,
      required this.quantity,
      required this.deliveryService,
      required this.mapKey})
      : super(key: mapKey);
      
  @override  
  _WholesaleDeliveryDetailsScreenState createState() => _WholesaleDeliveryDetailsScreenState();  
}  
  
class _WholesaleDeliveryDetailsScreenState extends State<WholesaleDeliveryDetailsScreen> {  


  ItemPackageModel item = ItemPackageModel();
  int? quantity;
  String? selecteddeliveryService;
  String username= "";
  DeliveryAddressModel deliveryAddressModel = DeliveryAddressModel();


   void getloggedUserDeliveryAddressDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString("_id");
    print(prefs.getString("_id"));
    var res =  await getDeliveryAddressDetailsOfLoggedCustomer(context,prefs.getString("_id"));
    print(res["DeliveryAddress"].toString());
    setState(() {
      deliveryAddressModel = DeliveryAddressModel.fromJson(res["DeliveryAddress"]);
      username = prefs.getString("user")!;
    });

  }

  @override
  void initState() {
    item = widget.itemModel;
    quantity = widget.quantity;
    selecteddeliveryService = widget.deliveryService;
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
            title: const Text('Confirm Delivery Address '),  
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
                                  "Confirm Your Delivery Address Details",
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
                                          username.toString(),
                                          style: const TextStyle(
                                              fontSize: 18, 
                                              fontWeight: FontWeight.bold,
                                              color:colorGreen
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                 Row(
                                    children: [
                              
                                      const Text(
                                        "Selected Delivery Service : -",
                                        style:  TextStyle(
                                            fontSize: 18, 
                                            fontWeight: FontWeight.bold,
                                            color:Colors.black                                              
                                        ),
                                      ),
                              
                                      Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          selecteddeliveryService.toString(),
                                          style: const TextStyle(
                                              fontSize: 18, 
                                              fontWeight: FontWeight.bold,
                                              color:colorGreen
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                              Row(
                                children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child:Container(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        color: colorBlue2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextButton(                              
                                              onPressed: ()=>{
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => DeliveryDetailsUpdate()),
                                                )                                
                                              }, 
                                              child: const Text(
                                                "Edit Delivery Details",
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
                                    MaterialPageRoute(builder: (context) => WholeSaleOrderConfirmScreen( itemModel: item, quantity: quantity as int , deliveryService : selecteddeliveryService as String , mapKey: UniqueKey(), )),
                                  )                                
                                }, 
                                child: const Text(
                                  "Confirm Delivery Details",
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

