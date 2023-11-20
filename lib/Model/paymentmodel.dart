// To parse this JSON data, do
//
//     final paymentPackagesModel = paymentPackagesModelFromJson(jsonString);

import 'dart:convert';

PaymentPackagesModel paymentPackagesModelFromJson(String str) => PaymentPackagesModel.fromJson(json.decode(str));

String paymentPackagesModelToJson(PaymentPackagesModel data) => json.encode(data.toJson());

class PaymentPackagesModel {
  int response;
  String message;
  List<Datum> data;

  PaymentPackagesModel({
    required this.response,
    required this.message,
    required this.data,
  });

  factory PaymentPackagesModel.fromJson(Map<String, dynamic> json) => PaymentPackagesModel(
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
  String paymentId;
  String companyId;
  String serviceId;
  String packageId;
  String userId;
  String transactionId;
  String amount;
  String status;
  DateTime payDate;
  String packageName;
  String price;
  String discount;
  String couponCode;
  String duration;
  String offerCode;
  String offerValue;

  Datum({
    required this.paymentId,
    required this.companyId,
    required this.serviceId,
    required this.packageId,
    required this.userId,
    required this.transactionId,
    required this.amount,
    required this.status,
    required this.payDate,
    required this.packageName,
    required this.price,
    required this.discount,
    required this.couponCode,
    required this.duration,
    required this.offerCode,
    required this.offerValue,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    paymentId: json["payment_id"],
    companyId: json["company_id"],
    serviceId: json["service_id"],
    packageId: json["package_id"],
    userId: json["user_id"],
    transactionId: json["transaction_id"],
    amount: json["amount"],
    status: json["status"],
    payDate: DateTime.parse(json["pay_date"]),
    packageName: json["package_name"],
    price: json["price"],
    discount: json["discount"],
    couponCode: json["coupon_code"],
    duration: json["duration"],
    offerCode: json["offer_code"],
    offerValue: json["offer_value"],
  );

  Map<String, dynamic> toJson() => {
    "payment_id": paymentId,
    "company_id": companyId,
    "service_id": serviceId,
    "package_id": packageId,
    "user_id": userId,
    "transaction_id": transactionId,
    "amount": amount,
    "status": status,
    "pay_date": payDate.toIso8601String(),
    "package_name": packageName,
    "price": price,
    "discount": discount,
    "coupon_code": couponCode,
    "duration": duration,
    "offer_code": offerCode,
    "offer_value": offerValue,
  };
}
