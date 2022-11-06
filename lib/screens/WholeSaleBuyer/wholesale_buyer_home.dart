
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uee_taprobane/controller/item_route.dart';
import 'package:uee_taprobane/models/ItemModel.dart';
import 'package:uee_taprobane/screens/ForiegnUser/single_product_view.dart';
import 'package:uee_taprobane/screens/auth/login_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class WholeSaleBuyerHome extends StatefulWidget {  
  @override  
  _WholeSaleBuyerHomeState createState() => _WholeSaleBuyerHomeState();  
}  
  
class _WholeSaleBuyerHomeState extends State<WholeSaleBuyerHome> {  


  List<ItemModel> items = [];

  Future<dynamic> getAllItems()async {
    dynamic data = await getAllItemsToForeignCustomer(context);
    print("Item screen print");
    print(data["Items"]);
    for(var i = 0; i < data["Items"].length;i++ )
    {
      ItemModel order = ItemModel.fromJson(data["Items"][i]);
      setState(() {
        items.add(order);
      });

    }
  }

  @override
  void initState() {
    getAllItems();
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
            title: const Text('Home'),  
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              crossAxisAlignment: CrossAxisAlignment.center ,
              children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child:Container(
                      width: size.width *0.2,
                      child: Image.asset(                    
                        "${imagePath}craftsman.png"
                        ),
                      ),
                    ),
                  const  Padding(
                    padding: EdgeInsets.only(right:10),
                    child: Text(
                      'Taprobane',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: colorGreen
                      ),
                    ),
                  ),            
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              crossAxisAlignment: CrossAxisAlignment.center ,
              children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: size.width *0.2,
                      child:const  Icon(
                            Icons.storage_sharp,
                            size : 40 ,
                          ),
                      ),
                    ),
                   Padding(
                    padding: EdgeInsets.only(right:10),
                    child: Container(
                      width: size.width * 0.70,
                      height: size.height * 0.055,
                      child: TextFormField(                        
                        decoration:const InputDecoration(
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1)),
                        ),
                      ), 
                      ),
                    ),
                  ), 
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  width: size.width,
                  child: Image.asset(                    
                    "${imagePath}wood.png"
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  color: colorGreen,
                  width: size.width,
                  height: 40,
                  child:const Padding(
                      padding:  EdgeInsets.all(5),
                      child: Text(
                        "NEW ARRIVALES",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          ),
                        ),
                    ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(     
                        margin : const EdgeInsets.all(10.0),    
                        child: Container(                          
                          child: Column(
                            children: [
                              Container(
                                width: size.width * 0.3,
                                child: Image.asset(                    
                                  "${imagePath}craftsman.png"
                                  ),
                                ),
                              const SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child:  Text(
                                    items[index].name.toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                               Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child:  Text(
                                    items[index].unit_price.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                  crossAxisAlignment: CrossAxisAlignment.center ,
                                  children: [
                                      Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: TextButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(colorGreen),
                                            ),
                                            onPressed: ()=>{
                                              Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => ViewSelectedItem(itemModel: items[index], mapKey: UniqueKey(),),)),                                            
                                            }, 
                                            child: const Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                              ),
                                            ),
                                        ),
                                      ),
                                       Padding(
                                        padding: const EdgeInsets.only(right:20),
                                        child: TextButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                            ),
                                            onPressed: ()=>{
                                              showSuccessToastMessage("Added to Wish List..!")
                                            }, 
                                            child: Container(
                                              height:30,
                                              width: 30,
                                              child:Image.asset("${imagePath}heart.gif"),
                                            ),
                                        ),
                                      ),            
                                  ],
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  ),
                ),
          ] 
        ),  
      );
  }  
}  