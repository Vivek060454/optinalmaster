// To parse this JSON data, do
//
//     final homePackagesModel = homePackagesModelFromJson(jsonString);

import 'dart:convert';

HomePackagesModel homePackagesModelFromJson(String str) => HomePackagesModel.fromJson(json.decode(str));

String homePackagesModelToJson(HomePackagesModel data) => json.encode(data.toJson());

class HomePackagesModel {
  int response;
  String message;
  List<Datum> data;

  HomePackagesModel({
    required this.response,
    required this.message,
    required this.data,
  });

  factory HomePackagesModel.fromJson(Map<String, dynamic> json) => HomePackagesModel(
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
  String packageId;
  String companyId;
  String serviceId;
  String packageName;
  String price;
  String discount;
  String couponCode;
  String duration;
  String offerCode;
  String offerValue;

  Datum({
    required this.packageId,
    required this.companyId,
    required this.serviceId,
    required this.packageName,
    required this.price,
    required this.discount,
    required this.couponCode,
    required this.duration,
    required this.offerCode,
    required this.offerValue,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    packageId: json["package_id"],
    companyId: json["company_id"],
    serviceId: json["service_id"],
    packageName: json["package_name"],
    price: json["price"],
    discount: json["discount"],
    couponCode: json["coupon_code"],
    duration: json["duration"],
    offerCode: json["offer_code"],
    offerValue: json["offer_value"],
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "company_id": companyId,
    "service_id": serviceId,
    "package_name": packageName,
    "price": price,
    "discount": discount,
    "coupon_code": couponCode,
    "duration": duration,
    "offer_code": offerCode,
    "offer_value": offerValue,
  };
}
