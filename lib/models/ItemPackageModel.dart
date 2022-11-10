import 'package:uee_taprobane/models/ItemModel.dart';
import 'package:uee_taprobane/models/MerchantModel.dart';

class ItemPackageModel {
  String? package_id;
  ItemModel? Item_id;
  String? name;
  String? no_units;
  String? unit_price;
  String? package_price;

  ItemPackageModel({
    this.package_id,
    this.Item_id,
    this.name,
    this.no_units,
    this.unit_price,
    this.package_price,
  });

  ItemPackageModel.fromJson(Map<String, dynamic> json) {
    package_id = json['package_id'];
    Item_id = json['Item_id'] != null
        ? new ItemModel.fromJson(json['Item_id'])
        : null;
    name = json['name'];
    no_units = json['no_units'];
    unit_price = json['unit_price'];
    package_price = json['package_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> itemPackageModel = new Map<String, dynamic>();
    itemPackageModel['package_id'] = this.package_id;
    if (this.Item_id != null) {
      itemPackageModel['Item_id'] = this.Item_id!.toJson();
    }
    itemPackageModel['name'] = this.name;
    itemPackageModel['no_units'] = this.no_units;
    itemPackageModel['unit_price'] = this.unit_price;
    itemPackageModel['package_price'] = this.package_price;
    return itemPackageModel;
  }
}