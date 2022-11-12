import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uee_taprobane/controller/api.dart';

Future<String> uploadProductImage(File image, BuildContext context) async {
  // showLoadingDialog(context);
  var request = http.MultipartRequest(
      "POST", Uri.parse('http://10.0.2.2:5000' + Api.uploadProductImageApi));
  var pic = await http.MultipartFile.fromPath("image", image.path);
  //add multipart to request
  request.files.add(pic);
  request.headers.addAll({
    // "Authorization": "Bearer " + Api.accessToken!,
    'Content-Type': 'application/json; charset=UTF-8'
  });
  var response = await request.send();

  //Get the response from the server
  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  print(responseString);
  Map<String, dynamic> res = jsonDecode(responseString);

  // hideDialog(context);
  return res['image'];
}
