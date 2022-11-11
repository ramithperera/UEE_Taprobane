import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uee_taprobane/controller/api.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';

Future<String?> userLogin(context, body) async {
  Uri uri = Uri.http(Api.baseUrl, Api.loginApi);

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
    showToastMessage('Login failed.Try again!');
    return null;
  }
}


Future<String?> userRegister(context, body) async {
  Uri uri = Uri.http(Api.baseUrl, Api.registerApi);

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
    showToastMessage('Login failed.Try again!');
    return null;
  }
}

Future<dynamic> getUser(context , id) async {
  Uri uri = Uri.http(Api.baseUrl,Api.getUserApi + id);

  //showLoadingDialog(context);
  var response = await http.get(uri,
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

Future<String?> userUpdate(context, body, id) async {
  Uri uri = Uri.http(Api.baseUrl, Api.userUpdateApi + id);

  showLoadingDialog(context);
  var response = await http.put(uri,
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
    showToastMessage('Login failed.Try again!');
    return null;
  }
}

Future<String?> userDelete(context, id) async {
  Uri uri = Uri.http(Api.baseUrl, Api.userRemoveApi + id);

  showLoadingDialog(context);
  var response = await http.delete(uri,
      headers: {"Accept": "application/json"},);
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
    showToastMessage('Login failed.Try again!');
    return null;
  }
}
