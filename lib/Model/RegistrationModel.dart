// To parse this JSON data, do
//
//     final registeration = registerationFromJson(jsonString);

import 'dart:convert';

Registeration registerationFromJson(String str) => Registeration.fromJson(json.decode(str));

String registerationToJson(Registeration data) => json.encode(data.toJson());

class Registeration {
    Registeration({
        required this.stutus,
       required this.token,
       required this.data,
    });

    bool stutus;
    String token;
    Data data;

    factory Registeration.fromJson(Map<String, dynamic> json) => Registeration(
        stutus: json["stutus"],
        token: json["token"],
        data: Data.fromJson(json["Data"]),
    );

    Map<String, dynamic> toJson() => {
        "stutus": stutus,
        "token": token,
        "Data": data.toJson(),
    };
}

class Data {
    Data({
       required this.id,
       required this.firstName,
       required this.lastName,
       required this.email,
       required this.address,
       required this.phone,
       required this.status,
       required this.createdAt,
       required this.updatedAt,
    });

    int id;
    String firstName;
    String lastName;
    String email;
    dynamic address;
    String phone;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "address": address,
        "phone": phone,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
