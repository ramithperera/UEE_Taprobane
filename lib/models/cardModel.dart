import 'package:uee_taprobane/models/MerchantModel.dart';

class CardModel {
  String? ctype;
  String? holder;
  String? cardNum;
  String? year;
  String? month;
  String? cvv;
  String? card_Owner;

  CardModel({
    this.ctype,
    this.holder,
    this.cardNum,
    this.year,
    this.month,
    this.cvv,
    this.card_Owner,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    ctype = json['ctype'];
    holder = json['holder'];
    cardNum = json['cardNum'];
    year = json['year'];
    month = json['month'];
    cvv = json['cvv'];
    card_Owner = json['card_Owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> cardModel = new Map<String, dynamic>();
    cardModel['ctype'] = this.ctype;
    cardModel['holder'] = this.holder;
    cardModel['cardNum'] = this.cardNum;
    cardModel['year'] = this.year;
    cardModel['month'] = this.month;
    cardModel['cvv'] = this.cvv;
    cardModel['card_Owner'] = this.card_Owner;
    return cardModel;
  }
}