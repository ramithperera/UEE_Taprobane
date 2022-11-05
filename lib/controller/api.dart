//all api endpoints 

//All api endpoints go here
class Api {
  static String? accessToken;
  static const String baseUrl = '10.0.2.2:5000';

  static const String loginApi = "/taprobane/signin";
  static const String registerApi = "/taprobane/signup";
  static const String uploadProductImageApi = "/taprobane/product";

  static const String getAllItems = "/item/getAllItems";

}