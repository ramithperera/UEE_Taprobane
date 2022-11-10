import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:uee_taprobane/controller/api.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

Future<dynamic> getDeliveryAddressDetailsOfLoggedCustomer(context , id) async {
  Uri uri = Uri.http(Api.baseUrl,Api.getDeliveryAddressByID + id);

  //showLoadingDialog(context);
  var response = await http.get(uri,
      headers: {"Accept": "application/json"});
  //hideDialog(context);
  if (response.statusCode == 200) {
    Map<String, dynamic> details = jsonDecode(response.body);
    print("inside DeliveryAddress  route");
    print(details["data"]);
    return details["data"];
  } else {
    return null;
  }
}

Future<String?> userAddressInsert(context, body) async {
  Uri uri = Uri.http(Api.baseUrl, Api.createNewDeliveryDetails);

  showLoadingDialog(context);
  var response = await http.post(uri,
      headers: {"Accept": "application/json"}, body: body);
  hideDialog(context);
  if (response.statusCode == 200) {
    return response.body;
  } else if (response.statusCode == 404) {
    showToastMessage(jsonDecode(response.body)["message"]);
    return null;
  } else if (response.statusCode == 401) {
    showToastMessage(jsonDecode(response.body)["message"]);
    return null;
  } else {
    showToastMessage('Insert Card failed.Try again!');
    return null;
  }
}

Future<String?> userAddressUpdate(context, body , id) async {
  Uri uri = Uri.http(Api.baseUrl, Api.updateDeliveryDetails + id);

  showLoadingDialog(context);
  var response = await http.put(uri,
      headers: {"Accept": "application/json"}, body: body);
  hideDialog(context);
  print(response.toString());
  if (response.statusCode == 200) {
    return response.body;
  } else if (response.statusCode == 404) {
    showToastMessage(jsonDecode(response.body)["message"]);
    return null;
  } else if (response.statusCode == 401) {
    showToastMessage(jsonDecode(response.body)["message"]);
    return null;
  } else {
    showToastMessage('Insert Card failed.Try again!');
    return null;
  }
}

Future<dynamic> deleteDeliveryAddressDetailsOfLoggedCustomer(context , id) async {
  Uri uri = Uri.http(Api.baseUrl,Api.deleteDeliveryDetails + id);

  //showLoadingDialog(context);
  var response = await http.delete(uri,
      headers: {"Accept": "application/json"});
  //hideDialog(context);
  if (response.statusCode == 200) {
    Map<String, dynamic> details = jsonDecode(response.body);
    print("inside cart route");
    print(details["data"]);
    return details["data"];
  } else {
    return null;
  }
}