// To parse this JSON data, do
//
//     final servicePackagesModel = servicePackagesModelFromJson(jsonString);

import 'dart:convert';

ServicePackagesModel servicePackagesModelFromJson(String str) => ServicePackagesModel.fromJson(json.decode(str));

String servicePackagesModelToJson(ServicePackagesModel data) => json.encode(data.toJson());

class ServicePackagesModel {
  int response;
  String message;
  List<Datum> data;

  ServicePackagesModel({
    required this.response,
    required this.message,
    required this.data,
  });

  factory ServicePackagesModel.fromJson(Map<String, dynamic> json) => ServicePackagesModel(
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
  String servicedetailId;
  String companyId;
  String serviceId;
  String packageId;
  String recommendations;
  String instrument;
  String rangeUpper;
  String rangeLower;
  String lotSize;
  String target1;
  String target2;
  String stopLoss;
  String duration;
  String createdBy;
  DateTime createdDate;
  String updatedBy;

  Datum({
    required this.servicedetailId,
    required this.companyId,
    required this.serviceId,
    required this.packageId,
    required this.recommendations,
    required this.instrument,
    required this.rangeUpper,
    required this.rangeLower,
    required this.lotSize,
    required this.target1,
    required this.target2,
    required this.stopLoss,
    required this.duration,
    required this.createdBy,
    required this.createdDate,
    required this.updatedBy,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    servicedetailId: json["servicedetail_id"],
    companyId: json["company_id"],
    serviceId: json["service_id"],
    packageId: json["package_id"],
    recommendations: json["recommendations"],
    instrument: json["instrument"],
    rangeUpper: json["range_upper"],
    rangeLower: json["range_lower"],
    lotSize: json["lot_size"],
    target1: json["target_1"],
    target2: json["target_2"],
    stopLoss: json["stop_loss"],
    duration: json["duration"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "servicedetail_id": servicedetailId,
    "company_id": companyId,
    "service_id": serviceId,
    "package_id": packageId,
    "recommendations": recommendations,
    "instrument": instrument,
    "range_upper": rangeUpper,
    "range_lower": rangeLower,
    "lot_size": lotSize,
    "target_1": target1,
    "target_2": target2,
    "stop_loss": stopLoss,
    "duration": duration,
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "updated_by": updatedBy,
  };
}
