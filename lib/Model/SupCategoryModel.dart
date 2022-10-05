// To parse this JSON data, do
//
//     final supCategoryModel = supCategoryModelFromJson(jsonString);

import 'dart:convert';

SupCategoryModel supCategoryModelFromJson(String str) =>
    SupCategoryModel.fromJson(json.decode(str));

String supCategoryModelToJson(SupCategoryModel data) =>
    json.encode(data.toJson());

class SupCategoryModel {
  SupCategoryModel({
    required this.categorise,
    required this.sup,
  });

  List<Categorise> categorise;
  List<Categorise> sup;

  factory SupCategoryModel.fromJson(Map<String, dynamic> json) =>
      SupCategoryModel(
        categorise: List<Categorise>.from(
            json["Categorise"].map((x) => Categorise.fromJson(x))),
        sup: List<Categorise>.from(
            json["Sup"].map((x) => Categorise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Categorise": List<dynamic>.from(categorise.map((x) => x.toJson())),
        "Sup": List<dynamic>.from(sup.map((x) => x.toJson())),
      };
}

class Categorise {
  Categorise({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory Categorise.fromJson(Map<String, dynamic> json) => Categorise(
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

SupCategoryModel2 supCategoryModel2FromJson(String str) =>
    SupCategoryModel2.fromJson(json.decode(str));

String supCategoryModel2ToJson(SupCategoryModel2 data) =>
    json.encode(data.toJson());

class SupCategoryModel2 {
  SupCategoryModel2({
    required this.categorise,
    required this.sup,
  });

  List<Categorise> categorise;
  List<Categorise> sup;

  factory SupCategoryModel2.fromJson(Map<String, dynamic> json) =>
      SupCategoryModel2(
        categorise: List<Categorise>.from(
            json["Categorise"].map((x) => Categorise.fromJson(x))),
        sup: List<Categorise>.from(
            json["Sup"].map((x) => Categorise.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Categorise": List<dynamic>.from(categorise.map((x) => x.toJson())),
        "Sup": List<dynamic>.from(sup.map((x) => x.toJson())),
      };
}

class Categoris {
  Categoris({
    required this.id,
    required this.name,
    required this.image,
  });

  int id;
  String name;
  String image;

  factory Categoris.fromJson(Map<String, dynamic> json) => Categoris(
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
