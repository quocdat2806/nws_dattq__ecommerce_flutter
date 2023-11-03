import 'dart:convert';
List<NotificationEntity> parseNotification(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<NotificationEntity>((json) => NotificationEntity.fromJson(json)).toList();
}
class NotificationEntity {
  String ?id;
  bool ?isRead;
  String ?createdAt;
  String ?image;

  NotificationEntity({
    this.id,
    this.isRead,
    this.createdAt,
    this.image,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) => NotificationEntity(
    id: json["id"],
    isRead: json["isRead"],
    createdAt:json["createdAt"],
    image:json["image"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isRead":isRead,
    "createdAt":createdAt,
    "image":image,

  };


}
