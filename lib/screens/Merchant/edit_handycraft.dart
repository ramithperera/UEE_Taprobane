import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uee_taprobane/controller/product_route.dart';
import 'package:uee_taprobane/custom/custom_border_view.dart';
import 'package:uee_taprobane/custom/custom_success_screeen.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class EditHandicraft extends StatefulWidget {
  EditHandicraft({Key? key}) : super(key: key);

  @override
  State<EditHandicraft> createState() => _EditHandicraftState();
}

class _EditHandicraftState extends State<EditHandicraft> {
  File? image;
  bool isPic = false;
  List<String> imgUrl = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Handicraft',
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
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Handicraft Name",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: color33,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                          textAlign: TextAlign.left),
                    ),
                    addVerticalSpace(8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xffc4c2c2),
                                offset: Offset(0, 0),
                                spreadRadius: 1,
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,
                              )
                            ]),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              // controller: fullNameController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: "Please enter Handicraft Name",
                                // labelText: "Email address",
                                border: InputBorder.none,
                                // labelStyle: TextStyle(
                                //   color: colorOrange
                                // ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    addVerticalSpace(20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Description",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: color33,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                          textAlign: TextAlign.left),
                    ),
                    addVerticalSpace(8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xffc4c2c2),
                                offset: Offset(0, 0),
                                spreadRadius: 1,
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            // controller: fullNameController,
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: "Please enter your Description",
                              // labelText: "Email address",
                              border: InputBorder.none,
                              // labelStyle: TextStyle(
                              //   color: colorOrange
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    addVerticalSpace(20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Price",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: color33,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                          textAlign: TextAlign.left),
                    ),
                    addVerticalSpace(8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: size.height * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xffc4c2c2),
                                offset: Offset(0, 0),
                                spreadRadius: 1,
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,
                              )
                            ]),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              // controller: fullNameController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: "Please enter handicraft price",
                                // labelText: "Email address",
                                border: InputBorder.none,
                                // labelStyle: TextStyle(
                                //   color: colorOrange
                                // ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    addVerticalSpace(20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Upload Image",
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                            color: color33,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                          textAlign: TextAlign.left),
                    ),
                    addVerticalSpace(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: GestureDetector(
                        onTap: () {
                          _imgFromGallery(setState);
                        },
                        child: CustomBoarderView(
                            child: Center(
                                child: Text(
                              'Upload',
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                            )),
                            radius: 18,
                            borderColor: colorBlue,
                            backgroundColor: colorBlue,
                            width: size.width * 0.4,
                            height: 50),
                      ),
                    ),
                    addVerticalSpace(16),
                    if (image != null)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                  top: 4.0,
                                ),
                                margin:
                                    const EdgeInsets.only(top: 0.0, right: 8.0),
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    image!,
                                    width: 80,
                                    height: 75,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0.0,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      image = null;
                                    });
                                  },
                                  child: const Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      height: 20,
                                      child: CircleAvatar(
                                        radius: 14.0,
                                        backgroundColor: Colors.black,
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
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
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomSuccessScreen(
                                    role: 'Handicraft',
                                    status: 'Updated',
                                  )));
                    },
                    child: Text(
                      'Update Handicraft',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                        color: color33,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 24.0,
                      )),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.8, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _imgFromGallery(StateSetter setState) async {
    final _picker = ImagePicker();
    XFile? _image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (_image != null) {
      setState(
        () {
          image = File(_image.path);
          isPic = true;
          uploadDisputePic();
        },
      );
    }
  }

  Future<void> uploadDisputePic() async {
    String imgRes = await uploadProductImage(image!, context);
    print(imgRes);
    imgUrl.add(imgRes);
    print('imgUrl haha');
    print(imgUrl);
  }
}
