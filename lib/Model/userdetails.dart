// To parse this JSON data, do
//
//     final userdetailmodel = userdetailmodelFromJson(jsonString);

import 'dart:convert';

Userdetailmodel userdetailmodelFromJson(String str) => Userdetailmodel.fromJson(json.decode(str));

String userdetailmodelToJson(Userdetailmodel data) => json.encode(data.toJson());

class Userdetailmodel {
  int response;
  String message;
  List<Datum> data;

  Userdetailmodel({
    required this.response,
    required this.message,
    required this.data,
  });

  factory Userdetailmodel.fromJson(Map<String, dynamic> json) => Userdetailmodel(
    response: json["response"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String userId;
  String companyId;
  String roleId;
  String fname;
  String lname;
  String email;
  String password;
  String mobile;
  String adhar;
  String pan;
  String address;
  String joinDate;
  String status;
  String createdBy;
  String createdDate;

  Datum({
    required this.userId,
    required this.companyId,
    required this.roleId,
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    required this.mobile,
    required this.adhar,
    required this.pan,
    required this.address,
    required this.joinDate,
    required this.status,
    required this.createdBy,
    required this.createdDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userId: json["user_id"],
    companyId: json["company_id"],
    roleId: json["role_id"],
    fname: json["fname"],
    lname: json["lname"],
    email: json["email"],
    password: json["password"],
    mobile: json["mobile"],
    adhar: json["adhar"],
    pan: json["pan"],
    address: json["address"],
    joinDate: json["join_date"],
    status: json["status"],
    createdBy: json["created_by"],
    createdDate: json["created_date"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "company_id": companyId,
    "role_id": roleId,
    "fname": fname,
    "lname": lname,
    "email": email,
    "password": password,
    "mobile": mobile,
    "adhar": adhar,
    "pan": pan,
    "address": address,
    "join_date": joinDate,
    "status": status,
    "created_by": createdBy,
    "created_date": createdDate,
  };
}
