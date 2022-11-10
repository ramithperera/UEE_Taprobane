import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/card_route.dart';
import 'package:uee_taprobane/models/ItemPackageModel.dart';
import 'package:uee_taprobane/models/cardModel.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/WholeSale_Delivery_service_select_screen.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';

class WholeSalePaymentConfirmScreen extends StatefulWidget {  
  final ItemPackageModel itemModel;
  final int quantity;
  final Key mapKey;

    const WholeSalePaymentConfirmScreen(
      {required this.itemModel,
      required this.quantity,
      required this.mapKey})
      : super(key: mapKey);
      
  @override  
  _WholeSalePaymentConfirmScreenState createState() => _WholeSalePaymentConfirmScreenState();  
}  
  
class _WholeSalePaymentConfirmScreenState extends State<WholeSalePaymentConfirmScreen> {  


  ItemPackageModel item = ItemPackageModel();
  int? quantity;
  int? total;
  CardModel card = CardModel();
  String userName = "";

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

  @override
  void initState() {
    item = widget.itemModel;
    quantity = widget.quantity;
    String onlyPrice = item.package_price!.substring(1);
    int price = int.parse(onlyPrice);
    total  = price * widget.quantity;
    getloggedUserPaymentDetails();
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
            title: const Text('Confirm Payment'),  
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
                                          "Price : " + item.package_price.toString(),
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
                                          "Units  : " + item.no_units.toString(),
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
                                  "Total Price : - " + "\$" +total.toString(),
                                  style: const TextStyle(
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
                                    "Card Type : -",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       card.ctype.toString(),
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
                                    "Card Holder name : -",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Expanded(child: Text(
                                       card.holder.toString(),
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
                                    "Card Number : -",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Expanded(child: Text(
                                       card.cardNum.toString(),
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
                                    "Card Year : -",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       card.year.toString(),
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
                                    "Card Month : -",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       card.month.toString(),
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
                                    "Card CVV : -",
                                    style:  TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black                                              
                                    ),
                                  ),
                          
                                  Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                       card.cvv.toString(),
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
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child:Container(
                                        width: MediaQuery.of(context).size.width * 0.7,
                                        color: colorBlue2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextButton(                              
                                              onPressed: ()=>{
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(builder: (context) => CustomSuccessScreen( role: userName, status: "payment", )),
                                                // )                                
                                              }, 
                                              child: const Text(
                                                "Edit Payment Details",
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
                                    MaterialPageRoute(builder: (context) => WholeSaleDeliveryServiceSelectScreen( itemModel: item, quantity: quantity as int ,  mapKey: UniqueKey(), )),
                                  )                                
                                }, 
                                child: const Text(
                                  "Continue to delivery",
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

