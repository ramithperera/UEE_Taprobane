class WholeSaleBuyerModel {
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

  WholeSaleBuyerModel({
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

  WholeSaleBuyerModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> wholeSaleBuyerModel = new Map<String, dynamic>();
    wholeSaleBuyerModel['_id'] = this.id;
    wholeSaleBuyerModel['Tp_id'] = this.Tp_id;
    wholeSaleBuyerModel['fullName'] = this.fullName;
    wholeSaleBuyerModel['mobileno'] = this.mobileno;
    wholeSaleBuyerModel['email'] = this.email;
    wholeSaleBuyerModel['password'] = this.password;
    wholeSaleBuyerModel['address'] = this.address;
    wholeSaleBuyerModel['dateOfBirth'] = this.dateOfBirth;
    wholeSaleBuyerModel['status'] = this.status;
    wholeSaleBuyerModel['country'] = this.country;
    wholeSaleBuyerModel['userRole'] = this.userRole;
    return wholeSaleBuyerModel;
  }
}