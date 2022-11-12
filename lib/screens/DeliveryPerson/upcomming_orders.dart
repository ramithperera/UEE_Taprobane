import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uee_taprobane/controller/item_route.dart';
import 'package:uee_taprobane/custom/custom_border_view.dart';
import 'package:uee_taprobane/custom/custom_confirm_dialog.dart';
import 'package:uee_taprobane/main.dart';
import 'package:uee_taprobane/models/ItemModel.dart';
import 'package:uee_taprobane/screens/DeliveryPerson/single_order_screen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class UpcommingOrders extends StatefulWidget {
  UpcommingOrders({Key? key}) : super(key: key);

  @override
  State<UpcommingOrders> createState() => _UpcommingOrdersState();
}

class _UpcommingOrdersState extends State<UpcommingOrders> {
  List<ItemModel> items = [];
  int itemCount = 0;

  Future<dynamic> getAllItems() async {
    dynamic data = await getAllItemsToForeignCustomer(context);
    print("Item screen print");
    print(data["Items"]);
    for (var i = 0; i < data["Items"].length; i++) {
      ItemModel order = ItemModel.fromJson(data["Items"][i]);
      setState(() {
        items.add(order);
        itemCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upcomming Orders',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        // automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.logout,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       logoutfunc();
        //     },
        //   )
        // ],
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                addVerticalSpace(20),
                Container(
                  height: 40,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        // hintText: "Please enter your Full Name",
                        suffixIcon: Icon(Icons.search),
                        // labelText: "Email address",
                        border: InputBorder.none,
                        // labelStyle: TextStyle(
                        //   color: colorOrange
                        // ),
                      ),
                    ),
                  ),
                ),
                addVerticalSpace(20),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemCount != 0 ? itemCount : 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: handicraftList(size, items[index]),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget handicraftList(Size size, ItemModel item) {
    return CustomBoarderView(
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1629736048693-6bc25970ac36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1503&q=80',
                  fit: BoxFit.cover,
                  height: 120,
                  memCacheHeight: 1500,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Handicraft Name: ',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: color33,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                        textAlign: TextAlign.left),
                    Text(
                        itemCount != 0
                            ? item.name!
                            : 'Pan wati dkcjdjcdjkdsjj vj nncjndncjknd lj',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: color33,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                        textAlign: TextAlign.left),
                    // addVerticalSpace(40),
                    Text('Description: ',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: color33,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                        textAlign: TextAlign.left),
                    Text(
                        itemCount != 0
                            ? item.description!
                            : 'Traditional Sri Lankan crafts are vital industries in many parts of the island',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: color33,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                        textAlign: TextAlign.left),
                    Row(
                      children: [
                        Text('Price: ',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            )),
                            textAlign: TextAlign.left),
                        Text(itemCount != 0 ? item.unit_price! : '80\$ ',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              color: color33,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                            textAlign: TextAlign.left),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          addVerticalSpace(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleOrderScreen()));
                },
                icon: Icon(Icons.library_books_rounded,
                    size: 30, color: Colors.black),
                label: Text('View Order'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.6, 40)),
              ),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     confirmDialog();
              //   },
              //   icon: Icon(Icons.delete_outline_rounded,
              //       size: 30, color: Colors.black),
              //   label: Text('Remove'),
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: colorRed,
              //       minimumSize: Size(size.width * 0.3, 40)),
              // ),
            ],
          ),
        ],
      ),
      radius: 12,
      borderColor: primaryColor,
      backgroundColor: Colors.transparent,
      width: size.width * 0.85,
      height: size.height * 0.26,
      stroke: 2,
    );
  }

  confirmDialog() {
    var baseDialog = CustomConfirmDialog(
      yesOnPressed: () {
        hideDialog(context);
        // cancelItem(orderLineModel);
        Navigator.pop(context);
      },
      noOnPressed: () {
        hideDialog(context);
      },
      title: 'Remove Handicraft',
      message: 'Are you sure you want to remove this handicraft?',
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }
}
