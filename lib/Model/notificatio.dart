import 'dart:convert';

Notifications notificationsFromJson(String str) =>
    Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
  Notifications({
    required this.data,
  });

  NotificationsData data;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        data: NotificationsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class NotificationsData {
  NotificationsData({
    required this.data,
  });

  List<Datum> data;

  factory NotificationsData.fromJson(Map<String, dynamic> json) =>
      NotificationsData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
   required this.id,
    required this.type,
    required this.notifiableId,
    required this.notifiableType,
    required this.data,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String type;
  String notifiableId;
  String notifiableType;
  DatumData data;
  dynamic readAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        notifiableId: json["notifiable_id"],
        notifiableType: json["notifiable_type"],
        data: DatumData.fromJson(json["data"]),
        readAt: json["read_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "notifiable_id": notifiableId,
        "notifiable_type": notifiableType,
        "data": data.toJson(),
        "read_at": readAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class DatumData {
  DatumData({
   required this.title,
    required this.message,
  });

  String title;
  String message;

  factory DatumData.fromJson(Map<String, dynamic> json) => DatumData(
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "message": message,
      };
}