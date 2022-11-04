class DeliveryPersonModel {
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
  String? vehicle_type;
  String? vehicle_number;

  DeliveryPersonModel({
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
    this.vehicle_type,
    this.vehicle_number,
  });

  DeliveryPersonModel.fromJson(Map<String, dynamic> json) {
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
    vehicle_type = json['vehicle_type'];
    vehicle_number = json['vehicle_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> deliveryPersonModel = new Map<String, dynamic>();
    deliveryPersonModel['_id'] = this.id;
    deliveryPersonModel['Tp_id'] = this.Tp_id;
    deliveryPersonModel['fullName'] = this.fullName;
    deliveryPersonModel['mobileno'] = this.mobileno;
    deliveryPersonModel['email'] = this.email;
    deliveryPersonModel['password'] = this.password;
    deliveryPersonModel['address'] = this.address;
    deliveryPersonModel['dateOfBirth'] = this.dateOfBirth;
    deliveryPersonModel['status'] = this.status;
    deliveryPersonModel['country'] = this.country;
    deliveryPersonModel['userRole'] = this.userRole;
    deliveryPersonModel['vehicle_type'] = this.vehicle_type;
    deliveryPersonModel['vehicle_number'] = this.vehicle_number;
    return deliveryPersonModel;
  }
}