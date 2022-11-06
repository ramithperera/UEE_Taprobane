import 'package:flutter/material.dart';
import 'package:uee_taprobane/models/ItemModel.dart';
import 'package:uee_taprobane/screens/ForiegnUser/normal_cart_screen.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/wholeSale_cart_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';

class ViewSelectedWholeSaleItem extends StatefulWidget {
  final ItemModel itemModel;
  final Key mapKey;

  const ViewSelectedWholeSaleItem(
      {required this.itemModel,
      required this.mapKey})
      : super(key: mapKey);

  @override
  createState() => new ViewSelectedWholeSaleItemState();
}

class ViewSelectedWholeSaleItemState extends State<ViewSelectedWholeSaleItem> {
  
  ItemModel itemModel = ItemModel();
  int item_quantity = 1;

  @override
  void initState() {
    // getinitialValues();
    itemModel = widget.itemModel;
    print("selected Data");
    print(itemModel.toJson().toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 200.0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_circle_left_rounded,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: Image.asset("${imagePath}noimage.gif"),
            // flexibleSpace: itemModel.image_url == null ?
            //                Image.asset("${imagePath}noimage.gif")
            //                :
            //                 Image.network(
            //                   itemModel.image_url!,
            //                   fit: BoxFit.cover,
            //                 ),
            backgroundColor: Colors.transparent,
          ),
        ],
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      color: colorGreen,
                      width: size.width * 0.9,
                      height: 90,
                      child:Column(
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                itemModel.unit_price.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'AirbnbCereal',
                                    fontWeight: FontWeight.bold),
                              ),
                            ), 
                          ),                          
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child:Align(
                            alignment: Alignment.centerLeft,
                              child: Text(
                                itemModel.name.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'AirbnbCereal',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),                          
                          ),                          
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),                
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.9,
                      height: 40,
                      child:Row(
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Image.asset("${imagePath}location.gif"),
                            ), 
                          ),                          
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child:Align(
                            alignment: Alignment.centerLeft,
                              child: Text(
                                "Location",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'AirbnbCereal',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),                          
                          ),                          
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),                
                const SizedBox(height: 20),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  //crossAxisAlignment: CrossAxisAlignment.center ,
                  children: [
                    Column(
                      children: [
                        Container(
                          //width: size.width * 0.9,
                          height: 40,
                          child:Row(
                            children: [
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left:10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset("${imagePath}cart.gif"),
                                ), 
                              ),                          
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.only(left:10),
                                child:Align(
                                alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'AirbnbCereal',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),                          
                              ),                          
                              const SizedBox(height: 10),
                            ],
                          ),
                        ), 
                      ],
                    ),
                    Column(
                      children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 90),
                            child: TextButton(
                                  onPressed:()=>{
                                      setState((() {
                                        item_quantity = item_quantity + 1;                                    
                                      }))
                                  } , 
                                  child:Icon(Icons.add) 
                              ),                            
                          ),
                      ],
                    ),                      
                    Column(
                      children: [
                         Padding(
                            padding: EdgeInsets.only(right:0),
                            child:Align(
                            alignment: Alignment.centerLeft,
                              child: Text(
                                item_quantity.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'AirbnbCereal',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextButton(
                                  onPressed:()=>{
                                      setState((() {
                                        item_quantity = item_quantity - 1;                                    
                                      }))
                                  } , 
                                  child:Icon(Icons.minimize_outlined) 
                              ),                            
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  child: const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),                
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'AirbnbCereal',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:const EdgeInsets.all(30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      itemModel.description.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'AirbnbCereal',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  child: const Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                ),
              ],
            ),
          ),
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
                                    MaterialPageRoute(builder: (context) => WholeSaleCartScreen( itemModel: itemModel, quantity: item_quantity ,  mapKey: UniqueKey(), )),
                                  )                                
                                }, 
                                child: const Text(
                                  "Buy Now",
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