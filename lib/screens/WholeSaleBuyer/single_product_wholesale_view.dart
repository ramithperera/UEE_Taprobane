import 'package:flutter/material.dart';
import 'package:uee_taprobane/controller/ItemPackage_route.dart';
import 'package:uee_taprobane/models/ItemModel.dart';
import 'package:uee_taprobane/models/ItemPackageModel.dart';
import 'package:uee_taprobane/screens/ForiegnUser/normal_cart_screen.dart';
import 'package:uee_taprobane/screens/WholeSaleBuyer/wholeSale_cart_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

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
  ItemPackageModel selecteditemPackageModel = ItemPackageModel();
  int item_quantity = 1;
  int total_price = 0;

  List<ItemPackageModel> itemPackages = [];

  Future<dynamic> getAllItemPackagesDetails()async {
    dynamic data = await getAllItemPackageDetails(context,widget.itemModel.id);
    print("Item Packages screen print");
    print(data["ItemPackage"]);
    for(var i = 0; i < data["ItemPackage"].length;i++ )
    {
      ItemPackageModel itemPackage = ItemPackageModel.fromJson(data["ItemPackage"][i]);
      setState(() {
        itemPackages.add(itemPackage);
      });

    }
  }

  void caltotalValues(String price , ItemPackageModel itemPackageModel){
    setState(() {
    String onlyPrice = price.substring(1);
    int fprice = int.parse(onlyPrice);
    total_price  = fprice * item_quantity;
    print(total_price);
    selecteditemPackageModel = itemPackageModel;
    });
  }

  @override
  void initState() {
    // getinitialValues();
    itemModel = widget.itemModel;
    print("selected Data");
    print(itemModel.toJson().toString());
    getAllItemPackagesDetails();
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
        body: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
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
                //packages display
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: ListView.builder(
                    itemCount: itemPackages.length,
                    itemBuilder: (context, index) {
                      return Card(     
                        margin : const EdgeInsets.all(5),    
                        child: Container(                          
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child:  Text(
                                    itemPackages[index].name.toString(),
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
                                    itemPackages[index].no_units.toString() + " units",
                                    style: const TextStyle(
                                      fontSize: 15,
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
                                    itemPackages[index].package_price.toString(),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                                  crossAxisAlignment: CrossAxisAlignment.center ,
                                  children: [
                                       Column(
                                          children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: TextButton(
                                                      onPressed:()=>{
                                                          setState((() {
                                                            item_quantity = item_quantity + 1;
                                                            caltotalValues( itemPackages[index].package_price.toString() , itemPackages[index]);                                    
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
                                                            caltotalValues(itemPackages[index].package_price.toString() , itemPackages[index]);                                     
                                                          }))
                                                      } , 
                                                      child:Icon(Icons.minimize_outlined) 
                                                  ),                            
                                              ),
                                          ],
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

              ],
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
                                    MaterialPageRoute(builder: (context) => WholeSaleCartScreen( itemModel: selecteditemPackageModel, quantity: item_quantity , total_price: total_price ,  mapKey: UniqueKey(), )),
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