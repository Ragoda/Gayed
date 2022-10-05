// To parse this JSON data, do
//
//     final showRoomModel = showRoomModelFromJson(jsonString);

import 'dart:convert';

ShowRoomModel showRoomModelFromJson(String str) =>
    ShowRoomModel.fromJson(json.decode(str));

String showRoomModelToJson(ShowRoomModel data) => json.encode(data.toJson());

class ShowRoomModel {
  ShowRoomModel({
    required this.data,
    required this.status,
    required this.statusCode,
    required this.statusType,
  });

  List<Datu> data;
  bool status;
  int statusCode;
  String statusType;

  factory ShowRoomModel.fromJson(Map<String, dynamic> json) => ShowRoomModel(
        data: List<Datu>.from(json["data"].map((x) => Datu.fromJson(x))),
        status: json["status"],
        statusCode: json["StatusCode"],
        statusType: json["StatusType"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "StatusCode": statusCode,
        "StatusType": statusType,
      };
}

class Datu {
  Datu(
      {required this.id,
      required this.daysWrok,
      required this.location,
      required this.lat,
      required this.lng,
      required this.hourStart,
      required this.hourEnd,
      required this.phone});

  int id;
  dynamic daysWrok;
  String location;
  String phone;
  String lat;
  String lng;
  String hourStart;
  String hourEnd;

  factory Datu.fromJson(Map<String, dynamic> json) => Datu(
        id: json["id"],
        daysWrok: json["days_wrok"],
        location: json["location"],
        lat: json["lat"],
        lng: json["lng"],
        hourStart: json["hour_start"],
        hourEnd: json["hour_end"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "days_wrok": daysWrok,
        "location": location,
        "lat": lat,
        "lng": lng,
        "hour_start": hourStart,
        "hour_end": hourEnd,
        "phone": phone,
      };
}
