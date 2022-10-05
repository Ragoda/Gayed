// To parse this JSON data, do
//
//     final favoriteModeL = favoriteModeLFromJson(jsonString);

import 'dart:convert';

FavoriteModeL favoriteModeLFromJson(String str) =>
    FavoriteModeL.fromJson(json.decode(str));

String favoriteModeLToJson(FavoriteModeL data) => json.encode(data.toJson());

class FavoriteModeL {
  FavoriteModeL({
    required this.data,
  });

  List<FavoriteModeLDatum> data;

  factory FavoriteModeL.fromJson(Map<String, dynamic> json) => FavoriteModeL(
        data: List<FavoriteModeLDatum>.from(
            json["data"].map((x) => FavoriteModeLDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FavoriteModeLDatum {
  FavoriteModeLDatum({
    required this.id,
    required this.productsId,
    required this.userId,
    required this.products,
  });

  int id;
  String productsId;
  String userId;
  List<FavoriteModeLProduct> products;

  factory FavoriteModeLDatum.fromJson(Map<String, dynamic> json) =>
      FavoriteModeLDatum(
        id: json["id"],
        productsId: json["products_id"],
        userId: json["user_id"],
        products: List<FavoriteModeLProduct>.from(
            json["products"].map((x) => FavoriteModeLProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products_id": productsId,
        "user_id": userId,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class FavoriteModeLProduct {
  FavoriteModeLProduct({
    required this.id,
    required this.adminId,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.image,
    required this.color,
    required this.sizeId,
    required this.descEn,
    required this.descAr,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String adminId;
  String name;
  String price;
  String categoryId;
  String image;
  String color;
  String sizeId;
  String descEn;
  String descAr;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory FavoriteModeLProduct.fromJson(Map<String, dynamic> json) =>
      FavoriteModeLProduct(
        id: json["id"],
        adminId: json["admin_id"],
        name: json["name"],
        price: json["price"],
        categoryId: json["category_id"],
        image: json["image"],
        color: json["color"],
        sizeId: json["size_id"],
        descEn: json["desc_en"],
        descAr: json["desc_ar"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "name": name,
        "price": price,
        "category_id": categoryId,
        "image": image,
        "color": color,
        "size_id": sizeId,
        "desc_en": descEn,
        "desc_ar": descAr,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
