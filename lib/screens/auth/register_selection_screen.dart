
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/screens/auth/deliveryPerson_signup_screen.dart';
import 'package:uee_taprobane/screens/auth/foreign_user_signup_screen.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/screens/auth/merchant_signup_screen.dart';
import 'package:uee_taprobane/screens/auth/wholeSale_buyer_signup_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';

class RegisterSelectionHome extends StatefulWidget {  
  @override  
  _RegisterSelectionHomeState createState() => _RegisterSelectionHomeState();  
}  
  
class _RegisterSelectionHomeState extends State<RegisterSelectionHome> {  


   void goto(String page) {
    if(page == "merchant")
    {
       Navigator.push(
                context, MaterialPageRoute(builder: (context) => MerchantSignup()));     
    }
    if(page == "foriegnUser")
    {
       Navigator.push(
                context, MaterialPageRoute(builder: (context) => ForeignUserSignUp()));     
    }
    if(page == "wholesale_buyer")
    {
       Navigator.push(
                context, MaterialPageRoute(builder: (context) => WholeSaleBuyerSignup()));     
     }
    if(page == "delivery_person")
    {
       Navigator.push(
                context, MaterialPageRoute(builder: (context) => DeliveryPersonSignUp()));     
    }
  }


  @override  
  Widget build(BuildContext context) {  
      final Size size = MediaQuery.of(context).size;
    return Scaffold(       
          appBar: AppBar(  
            title: const Center(child: Text('Select Sign Up Role')),  
            automaticallyImplyLeading: false,
          ),
          body: Column(  
          children : [
            const SizedBox(height: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(213, 1, 184, 98)),
                  ),
                  onPressed:()=>goto("merchant"),
                  child: const Padding(
                        padding:  EdgeInsets.only(left: 65,right: 65 , top: 10 , bottom: 10),
                        child :Text(                                
                                'Merchant',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, 
                                  //fontStyle: FontStyle.italic,
                                  fontFamily: "calibr"
                                  ),
                              ),
                  ),
                ) ,
              ],
          ),
          const SizedBox(height: 30,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(                                    
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(213, 1, 184, 98)),                    
                  ),
                  onPressed:()=>goto("foriegnUser"),
                  child:const Padding(
                        padding: EdgeInsets.only(left: 65,right: 65 , top: 10 , bottom: 10),
                        child :Text(
                                'Customer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, 
                                  //fontStyle: FontStyle.italic,
                                  fontFamily: "calibr"
                                  ),
                              ),
                  ),
                ) 
              ],
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(                
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(213, 1, 184, 98)),
                ),
                onPressed:()=>goto("delivery_person"),
                child:const Padding(
                        padding: EdgeInsets.only(left: 40,right: 40 , top: 10 , bottom: 10),
                        child :Text(
                                'delivery Person',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, 
                                  //fontStyle: FontStyle.italic,
                                  fontFamily: "calibr"
                                  ),
                              ),
                  ),        
              ) 
            ],
          ),  
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(213, 1, 184, 98)),
                ),
                onPressed:()=>goto("wholesale_buyer"),
                child:const Padding(
                        padding:  EdgeInsets.only(left: 35,right: 35 , top: 10 , bottom: 10),
                        child :Text(
                                'Wholesale Buyer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20, 
                                  //fontStyle: FontStyle.italic,
                                  fontFamily: "calibr"
                                  ),
                              ),
                  ),        
              ) , 
            ],
          ),
          const SizedBox(height: 30,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextButton(
              child:const Text(
                            "Already have an account Sign In Here ? Sign In",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  LoginScreen(),
                  ),
                );
              
              } ,
            ),
          ),
          ] 
        ),  
      );
  }  
}  