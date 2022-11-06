import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uee_taprobane/custom/custom_border_view.dart';
import 'package:uee_taprobane/custom/custom_confirm_dialog.dart';
import 'package:uee_taprobane/main.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class OrderListScreen extends StatefulWidget {
  OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
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
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: orderContainer(size),
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

  Widget orderContainer(Size size) {
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
                Text('9029239839 ',
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
                Text('Pan wati ',
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
                Text('Customer Name: ',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                    textAlign: TextAlign.left),
                addHorizontalSpace(35),
                Text('Ramith ',
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
                Text('10',
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
                Text('Date: ',
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                      color: color33,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                    textAlign: TextAlign.left),
                addHorizontalSpace(128),
                Text('2022/11/05',
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
                    confirmDialog();
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
      title: 'Cancel Order',
      message: 'Are you sure you want to cancel this order?',
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }
}
