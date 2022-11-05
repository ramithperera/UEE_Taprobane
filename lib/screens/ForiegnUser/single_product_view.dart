import 'package:flutter/material.dart';
import 'package:uee_taprobane/models/ItemModel.dart';
import 'package:uee_taprobane/utils/constants.dart';

class ViewSelectedItem extends StatefulWidget {
  final ItemModel itemModel;
  final Key mapKey;

  const ViewSelectedItem(
      {required this.itemModel,
      required this.mapKey})
      : super(key: mapKey);

  @override
  createState() => new ViewSelectedItemState();
}

class ViewSelectedItemState extends State<ViewSelectedItem> {
  
  ItemModel itemModel = ItemModel();

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
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 200.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_circle_left_rounded,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: Image(
              image: NetworkImage("${imagePath}wood.png"),
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent,
          ),
        ],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "fooditem.name.toString()",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'AirbnbCereal',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "fooditem.description.toString()",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'AirbnbCereal',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Questions about allergens , ingredients or cooking methods?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'AirbnbCereal',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please Contact the resturant.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 180, 180),
                      fontSize: 15,
                      fontFamily: 'AirbnbCereal',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Clear Variations and Customizations",
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 10,
                  child: Divider(
                    color: Colors.grey,
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
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(child:Text("bottom Bar"),),
                    
                  SizedBox(height: 10),
                ],
              ),
            ),            
          ],
        ),
      ),
    );
  }
}