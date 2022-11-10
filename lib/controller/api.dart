//all api endpoints 

//All api endpoints go here
class Api {
  static String? accessToken;
  static const String baseUrl = '10.0.2.2:5000';

  static const String loginApi = "/taprobane/signin";
  static const String registerApi = "/taprobane/signup";
  static const String uploadProductImageApi = "/taprobane/product";

  static const String getAllItems = "/item/getAllItems";
  static const String getCardDetailsByID = "/card/getCardById/";
  static const String getDeliveryAddressByID = "/delivery-address/getDeliveryAddressById/";


  static const String createNewCard = "/card/createCard";
  static const String updateCard = "/card/updateCard/";
  static const String deleteCard = "/card/deleteCardDetails/";

  static const String createNewDeliveryDetails = "/delivery-address/createDeliveryAddress";
  static const String updateDeliveryDetails = "/delivery-address/updateDeliveryAddress/";
  static const String deleteDeliveryDetails = "/delivery-address/deleteDeliveryDetails/";


  static const String createNormalOrder = "/normal-order/createNormalOrder";
  static const String createWholeSaleOrder = "";

  static const String getItemPackageDetails = "/item-packages/getItemPackage/";
}