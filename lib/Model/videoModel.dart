// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
    required this.data,
    required this.status,
    required this.statusCode,
    required this.statusType,
  });

  List<Datum_vedio> data;
  bool status;
  int statusCode;
  String statusType;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        data: List<Datum_vedio>.from(
            json["data"].map((x) => Datum_vedio.fromJson(x))),
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

class Datum_vedio {
  Datum_vedio({
    required this.id,
    required this.link,
  });

  int id;
  String link;

  factory Datum_vedio.fromJson(Map<String, dynamic> json) => Datum_vedio(
        id: json["id"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
      };
}
