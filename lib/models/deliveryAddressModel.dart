import 'package:uee_taprobane/models/MerchantModel.dart';

class DeliveryAddressModel {
  String? address_owner;
  String? addressLine1;
  String? addressLine2;
  String? mobileno;

  DeliveryAddressModel({
    this.address_owner,
    this.addressLine1,
    this.addressLine2,
    this.mobileno,
  });

  DeliveryAddressModel.fromJson(Map<String, dynamic> json) {
    address_owner = json['address_owner'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    mobileno = json['mobileno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> deliveryAddressModel = new Map<String, dynamic>();
    deliveryAddressModel['address_owner'] = this.address_owner;
    deliveryAddressModel['addressLine1'] = this.addressLine1;
    deliveryAddressModel['addressLine2'] = this.addressLine2;
    deliveryAddressModel['mobileno'] = this.mobileno;
    return deliveryAddressModel;
  }
}