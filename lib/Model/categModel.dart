// To parserequired this JSON data, do
//
//     final categoryy = categoryyFromJson(jsonString);

import 'dart:convert';

Categoryy categoryyFromJson(String str) => Categoryy.fromJson(json.decode(str));

String categoryyToJson(Categoryy data) => json.encode(data.toJson());

class Categoryy {
  Categoryy({
    required this.data,
    required this.status,
    required this.statusCode,
    required this.statusType,
  });

  List<Datu> data;
  bool status;
  int statusCode;
  String statusType;

  factory Categoryy.fromJson(Map<String, dynamic> json) => Categoryy(
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
  Datu({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory Datu.fromJson(Map<String, dynamic> json) => Datu(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
