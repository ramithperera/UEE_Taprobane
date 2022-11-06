import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:uee_taprobane/controller/api.dart';
import 'package:uee_taprobane/utils/widget_functions.dart';



Future<String?> createNewNormalOrder(context, body) async {
  Uri uri = Uri.http(Api.baseUrl, Api.createNormalOrder);

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
