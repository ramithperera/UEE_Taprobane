class ForeignUserModel {
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

  ForeignUserModel({
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

  ForeignUserModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> foreignUserModel = new Map<String, dynamic>();
    foreignUserModel['_id'] = this.id;
    foreignUserModel['Tp_id'] = this.Tp_id;
    foreignUserModel['fullName'] = this.fullName;
    foreignUserModel['mobileno'] = this.mobileno;
    foreignUserModel['email'] = this.email;
    foreignUserModel['password'] = this.password;
    foreignUserModel['address'] = this.address;
    foreignUserModel['dateOfBirth'] = this.dateOfBirth;
    foreignUserModel['status'] = this.status;
    foreignUserModel['country'] = this.country;
    foreignUserModel['userRole'] = this.userRole;
    return foreignUserModel;
  }
}