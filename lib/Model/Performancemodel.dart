// To parse this JSON data, do
//
//     final performancePackagesModel = performancePackagesModelFromJson(jsonString);

import 'dart:convert';

PerformancePackagesModel performancePackagesModelFromJson(String str) => PerformancePackagesModel.fromJson(json.decode(str));

String performancePackagesModelToJson(PerformancePackagesModel data) => json.encode(data.toJson());

class PerformancePackagesModel {
  int response;
  String message;
  List<Datum> data;

  PerformancePackagesModel({
    required this.response,
    required this.message,
    required this.data,
  });

  factory PerformancePackagesModel.fromJson(Map<String, dynamic> json) => PerformancePackagesModel(
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
  String performanceId;
  String companyId;
  String servicedetailId;
  String quantity;
  String entry;
  String exit;
  String profitLoss;
  String disclaimer;
  String createdBy;
  String createdDate;

  Datum({
    required this.performanceId,
    required this.companyId,
    required this.servicedetailId,
    required this.quantity,
    required this.entry,
    required this.exit,
    required this.profitLoss,
    required this.disclaimer,
    required this.createdBy,
    required this.createdDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    performanceId: json["performance_id"],
    companyId: json["company_id"],
    servicedetailId: json["servicedetail_id"],
    quantity: json["quantity"],
    entry: json["entry"],
    exit: json["exit"],
    profitLoss: json["profit_loss"],
    disclaimer: json["disclaimer"],
    createdBy: json["created_by"],
    createdDate: json["created_date"],
  );

  Map<String, dynamic> toJson() => {
    "performance_id": performanceId,
    "company_id": companyId,
    "servicedetail_id": servicedetailId,
    "quantity": quantity,
    "entry": entry,
    "exit": exit,
    "profit_loss": profitLoss,
    "disclaimer": disclaimer,
    "created_by": createdBy,
    "created_date": createdDate,
  };
}
