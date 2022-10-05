// To parserequired this JSON data, do
//
//     final myOrderModel = myOrderModelFromJson(jsonString);

import 'dart:convert';

List<MyOrderModel> myOrderModelFromJson(String str) => List<MyOrderModel>.from(
    json.decode(str).map((x) => MyOrderModel.fromJson(x)));

String myOrderModelToJson(List<MyOrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyOrderModel {
  MyOrderModel({
    required this.orderId,
    required this.userId,
    required this.total,
    required this.numberNotification,
    required this.imageNotification,
    required this.status,
    required this.orders,
  });

  int orderId;
  dynamic userId;
  String total;
  String numberNotification;
  String imageNotification;
  dynamic status;
  List<Order> orders;

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
        orderId: json["orderId"],
        userId: json["userId"],
        total: json["total"],
        numberNotification: json["number_notification"] == null
            ? null
            : json["number_notification"],
        imageNotification: json["image_notification"] == null
            ? null
            : json["image_notification"],
        status: json["status"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "userId": userId,
        "total": total,
        "number_notification":
            numberNotification == null ? null : numberNotification,
        "image_notification":
            imageNotification == null ? null : imageNotification,
        "status": status,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    required this.quantity,
    required this.price,
    required this.summation,
    required this.product,
  });

  String quantity;
  String price;
  String summation;
  Product product;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        quantity: json["quantity"],
        price: json["price"],
        summation: json["summation"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "price": price,
        "summation": summation,
        "product": product.toJson(),
      };
}

class Product {
  Product({
    required this.id,
    required this.adminId,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.image,
    required this.colors,
    required this.sizes,
    required this.available,
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
  String colors;
  String sizes;
  String available;
  String descEn;
  String descAr;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        adminId: json["admin_id"],
        name: json["name"],
        price: json["price"],
        categoryId: json["category_id"],
        image: json["image"],
        colors: json["colors"],
        sizes: json["sizes"],
        available: json["available"],
        descEn: json["desc_en"],
        descAr: json["desc_ar"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "name": name,
        "price": price,
        "category_id": categoryId,
        "image": image,
        "colors": colors,
        "sizes": sizes,
        "available": available,
        "desc_en": descEn,
        "desc_ar": descAr,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
