// To parse this JSON data, do
//
//     final searchProductModel = searchProductModelFromJson(jsonString);

import 'dart:convert';

SearchProductModel searchProductModelFromJson(String str) =>
    SearchProductModel.fromJson(json.decode(str));

String searchProductModelToJson(SearchProductModel data) =>
    json.encode(data.toJson());

class SearchProductModel {
  SearchProductModel({
    required this.data,
    required this.status,
    required this.statusCode,
    required this.statusType,
  });

  List<Datum> data;
  bool status;
  int statusCode;
  String statusType;

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      SearchProductModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.image,
    required this.color,
    required this.sizes,
    required this.descEn,
    required this.descAr,
    required this.available,
    required this.category,
  });

  int id;
  String name;
  String price;
  String categoryId;
  String image;
  String color;
  dynamic sizes;
  String descEn;
  String descAr;
  String available;
  Category category;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        categoryId: json["category_id"],
        image: json["image"],
        color: json["color"],
        sizes: json["sizes"],
        descEn: json["desc_en"],
        descAr: json["desc_ar"],
        available: json["available"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "category_id": categoryId,
        "image": image,
        "color": color,
        "sizes": sizes,
        "desc_en": descEn,
        "desc_ar": descAr,
        "available": available,
        "category": category.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.adminId,
    required this.name,
    required this.parentId,
    required this.image,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String adminId;
  String name;
  String parentId;
  String image;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        adminId: json["admin_id"],
        name: json["name"],
        parentId: json["parent_id"],
        image: json["image"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "name": name,
        "parent_id": parentId,
        "image": image,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
