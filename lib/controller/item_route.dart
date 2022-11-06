import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:uee_taprobane/controller/api.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

Future<dynamic> getAllItemsToForeignCustomer(context) async {
  Uri uri = Uri.http(Api.baseUrl,Api.getAllItems);

  //showLoadingDialog(context);
  var response = await http.get(uri,
      headers: {"Accept": "application/json"});
  //hideDialog(context);
  if (response.statusCode == 200) {
    Map<String, dynamic> details = jsonDecode(response.body);
    print("inside Item route");
    print(details["data"]);
    return details["data"];
  } else {
    return null;
  }
}