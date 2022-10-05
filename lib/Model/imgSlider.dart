// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

ImageSlider ImageSliderFromJson(String str) =>
    ImageSlider.fromJson(json.decode(str));

String ImageSliderToJson(ImageSlider data) => json.encode(data.toJson());

class ImageSlider {
  ImageSlider({
    required this.data,
    required this.status,
    required this.statusCode,
    required this.statusType,
  });

  List<Datum_mg> data;
  bool status;
  int statusCode;
  String statusType;

  factory ImageSlider.fromJson(Map<String, dynamic> json) => ImageSlider(
        data:
            List<Datum_mg>.from(json["data"].map((x) => Datum_mg.fromJson(x))),
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

class Datum_mg {
  Datum_mg({
    required this.image,
  });

  String image;

  factory Datum_mg.fromJson(Map<String, dynamic> json) => Datum_mg(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
