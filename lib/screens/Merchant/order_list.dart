import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uee_taprobane/controller/ItemPackage_route.dart';
import 'package:uee_taprobane/custom/custom_border_view.dart';
import 'package:uee_taprobane/custom/custom_confirm_dialog.dart';
import 'package:uee_taprobane/main.dart';
import 'package:uee_taprobane/models/ItemPackageModel.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class OrderListScreen extends StatefulWidget {
  OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  List<ItemPackageModel> itemPackages = [];
  int itemCount = 0;

  Future<dynamic> getAllItemPackagesDetails() async {
    dynamic data = await getAllItemPackages(context);
    print("Item Packages screen print");
    print(data["ItemPackage"]);
    for (var i = 0; i < data["ItemPackage"].length; i++) {
      ItemPackageModel itemPackage =
          ItemPackageModel.fromJson(data["ItemPackage"][i]);
      setState(() {
        itemPackages.add(itemPackage);
        itemCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order List',
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
                addVerticalSpace(30),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemCount != 0 ? itemCount : 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: orderContainer(size, itemPackages[index], index),
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

  Widget orderContainer(Size size, ItemPackageModel itemPackage, int num) {
    return CustomBoarderView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text('Order ID: ',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                    textAlign: TextAlign.left),
                addHorizontalSpace(100),
                Text(itemCount != 0 ? itemPackage.package_id! : '9029239839 ',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                    textAlign: TextAlign.left),
              ],
            ),
            Row(
              children: [
                Text('Handicraft Name: ',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                    textAlign: TextAlign.left),
                addHorizontalSpace(30),
                Text(itemCount != 0 ? itemPackage.name! : 'Pan wati ',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                    textAlign: TextAlign.left),
              ],
            ),
            // Row(
            //   children: [
            //     Text('Customer Name: ',
            //         style: GoogleFonts.roboto(
            //             textStyle: const TextStyle(
            //           color: color33,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w700,
            //           fontStyle: FontStyle.normal,
            //         )),
            //         textAlign: TextAlign.left),
            //     addHorizontalSpace(35),
            //     Text('Ramith ',
            //         style: GoogleFonts.roboto(
            //             textStyle: const TextStyle(
            //           color: color33,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w700,
            //           fontStyle: FontStyle.normal,
            //         )),
            //         textAlign: TextAlign.left),
            //   ],
            // ),
            Row(
              children: [
                Text('Quantity of items: ',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                    textAlign: TextAlign.left),
                addHorizontalSpace(25),
                Text(itemCount != 0 ? itemPackage.no_units! : '10',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                    textAlign: TextAlign.left),
              ],
            ),
            // Row(
            //   children: [
            //     Text('Date: ',
            //         style: GoogleFonts.roboto(
            //             textStyle: const TextStyle(
            //           color: color33,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w700,
            //           fontStyle: FontStyle.normal,
            //         )),
            //         textAlign: TextAlign.left),
            //     addHorizontalSpace(128),
            //     Text('2022/11/05',
            //         style: GoogleFonts.roboto(
            //             textStyle: const TextStyle(
            //           color: color33,
            //           fontSize: 18,
            //           fontWeight: FontWeight.w700,
            //           fontStyle: FontStyle.normal,
            //         )),
            //         textAlign: TextAlign.left),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0,
                    )),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.2, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                ElevatedButton(
                  onPressed: () {
                    confirmDialog(num);
                  },
                  child: Text(
                    'Reject',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0,
                    )),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.2, 40),
                      backgroundColor: colorRed,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ],
            )
          ],
        ),
      ),
      radius: 20,
      borderColor: primaryColor,
      backgroundColor: Colors.transparent,
      width: size.width * 0.85,
      height: 200,
      stroke: 3,
    );
  }

  confirmDialog(index) {
    var baseDialog = CustomConfirmDialog(
      yesOnPressed: () {
        deleteOrder(index);
        hideDialog(context);
        // cancelItem(orderLineModel);
        Navigator.pop(context);
      },
      noOnPressed: () {
        hideDialog(context);
      },
      title: 'Cancel Order',
      message: 'Are you sure you want to cancel this order?',
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }

  void deleteOrder(index) async {
    var res = await deleteItemPackage(
        context, itemPackages[index].Item_id.toString());
    showToastMessage('Delete Card Success!');
  }
}
