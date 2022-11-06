import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uee_taprobane/utils/constants.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
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
                Image.asset(
                  imagePath + "profile.png",
                  height: size.width * 0.7,
                ),
                addVerticalSpace(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Name",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                                hintText: "Please enter your Name",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Email",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: "Please enter your email",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Mobile",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                hintText: "Please enter your mobile",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Location",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                                hintText: "Please enter your location",
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
                  ],
                ),
                addVerticalSpace(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: color33,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0,
                        )),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(size.width * 0.2, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Edit Profile',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: color33,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0,
                        )),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(size.width * 0.2, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
