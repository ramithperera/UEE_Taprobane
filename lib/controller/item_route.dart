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

Future<dynamic> getOneItemMerchant(context , id) async {
  Uri uri = Uri.http(Api.baseUrl,Api.getOneItem + id);

  //showLoadingDialog(context);
  var response = await http.get(uri,
      headers: {"Accept": "application/json"});
  //hideDialog(context);
  if (response.statusCode == 200) {
    Map<String, dynamic> details = jsonDecode(response.body);
    print("inside item route");
    print(details["data"]);
    return details["data"];
  } else {
    return null;
  }
}

Future<String?> createItemMerchant(context, body) async {
  Uri uri = Uri.http(Api.baseUrl, Api.createItem);

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
    showToastMessage('Item Creation failed.Try again!');
    return null;
  }
}

Future<String?> updateItemMerchant(context, body , id) async {
  Uri uri = Uri.http(Api.baseUrl, Api.updateItem + id);

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
    showToastMessage('Item Update failed.Try again!');
    return null;
  }
}

Future<dynamic> deleteItemMerchant(context , id) async {
  Uri uri = Uri.http(Api.baseUrl,Api.deleteItem + id);

  //showLoadingDialog(context);
  var response = await http.delete(uri,
      headers: {"Accept": "application/json"});
  //hideDialog(context);
  if (response.statusCode == 200) {
    Map<String, dynamic> details = jsonDecode(response.body);
    print("inside item route");
    print(details["data"]);
    return details["data"];
  } else {
    return null;
  }
}