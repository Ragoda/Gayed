// To parserequired this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.colors,
    required this.sizes,
    required this.available,
    required this.descEn,
    required this.descAr,
    required this.favorit,
    required this.categoy,
    required this.categoyImage,
  });

  String id;
  String name;
  String price;
  String image;
  dynamic colors;
  dynamic sizes;
  String available;
  String descEn;
  String descAr;
  dynamic favorit;
  String categoy;
  String categoyImage;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        colors: json["colors"],
        sizes: json["sizes"],
        available: json["available"],
        descEn: json["desc_en"],
        descAr: json["desc_ar"],
        favorit: json["favorit"],
        categoy: json["categoy"],
        categoyImage: json["categoy_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "colors": colors,
        "sizes": sizes,
        "available": available,
        "desc_en": descEn,
        "desc_ar": descAr,
        "favorit": favorit,
        "categoy": categoy,
        "categoy_image": categoyImage,
      };
}
