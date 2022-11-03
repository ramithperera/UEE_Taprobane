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
