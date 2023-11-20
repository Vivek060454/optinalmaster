// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);

import 'dart:convert';

Loginmodel loginmodelFromJson(String str) => Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
  int response;
  String message;
  Data? data;

  Loginmodel({
    required this.response,
    required this.message,
    required this.data,
  });

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
    response: json["response"],
    message: json["message"],
    data: Data.fromJson(json["data"]) ==  0 ? null: Data.fromJson(json["data"]),

  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "message": message,
    "data": data!.toJson() == null?null: data!.toJson(),

  };
}

class Data {
  String userId;
  String companyId;
  String roleId;
  String fullname;
  String email;

  Data({
    required this.userId,
    required this.companyId,
    required this.roleId,
    required this.fullname,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    companyId: json["company_id"],
    roleId: json["role_id"],
    fullname: json["fullname"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "company_id": companyId,
    "role_id": roleId,
    "fullname": fullname,
    "email": email,
  };
}
