import 'dart:convert';

class UserModel {
  String name;

  int phone;
  String vehicleNo;
  int type;
  String email;
  int status;

  UserModel(
      {required this.name,
      required this.phone,
      required this.vehicleNo,
      required this.email,
      required this.type,
      required this.status});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'vehicleNo': vehicleNo,
      'email': email,
      'type': type,
      'status': status,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] as String,
        phone: map['phone'] as int,
        vehicleNo: map['vehicleNo'] as String,
        email: map['email'] as String,
        type: map['type'] as int,
        status: map['status'] as int);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
