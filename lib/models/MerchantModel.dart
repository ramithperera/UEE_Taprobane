class MerchantModel {
  String? id;
  String? Tp_id;
  String? fullName;
  String? mobileno;
  String? email;
  String? password;
  String? address;
  String? dateOfBirth;
  String? status;
  String? country;
  String? userRole;

  MerchantModel({
    this.id,
    this.Tp_id,
    this.fullName,
    this.mobileno,
    this.email,
    this.password,
    this.address,
    this.dateOfBirth,
    this.status,
    this.country,
    this.userRole,
  });

  MerchantModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    Tp_id = json['Tp_id'];
    fullName = json['fullName'];
    mobileno = json['mobileno'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    dateOfBirth = json['dateOfBirth'];
    status = json['status'];
    country = json['country'];
    userRole = json['userRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> merchantModel = new Map<String, dynamic>();
    merchantModel['_id'] = this.id;
    merchantModel['Tp_id'] = this.Tp_id;
    merchantModel['fullName'] = this.fullName;
    merchantModel['mobileno'] = this.mobileno;
    merchantModel['email'] = this.email;
    merchantModel['password'] = this.password;
    merchantModel['address'] = this.address;
    merchantModel['dateOfBirth'] = this.dateOfBirth;
    merchantModel['status'] = this.status;
    merchantModel['country'] = this.country;
    merchantModel['userRole'] = this.userRole;
    return merchantModel;
  }
}