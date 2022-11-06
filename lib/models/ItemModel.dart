import 'package:uee_taprobane/models/MerchantModel.dart';

class ItemModel {
  String? item_id;
  String? name;
  String? description;
  bool? is_wholesale;
  String? unit_price;
  String? image_url;
  MerchantModel? owner;

  ItemModel({
    this.item_id,
    this.name,
    this.description,
    this.is_wholesale,
    this.unit_price,
    this.image_url,
    this.owner,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    item_id = json['item_id'];
    name = json['name'];
    description = json['description'];
    is_wholesale = json['is_wholesale'];
    unit_price = json['unit_price'];
    image_url = json['image_url'];
    owner = json['owner'] != null ? new MerchantModel.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> itemModel = new Map<String, dynamic>();
    itemModel['item_id'] = this.item_id;
    itemModel['name'] = this.name;
    itemModel['description'] = this.description;
    itemModel['is_wholesale'] = this.is_wholesale;
    itemModel['unit_price'] = this.unit_price;
    itemModel['image_url'] = this.image_url;
    if (this.owner != null) {
      itemModel['owner'] = this.owner!.toJson();
    }
    return itemModel;
  }
}