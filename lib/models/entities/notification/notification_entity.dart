import 'dart:convert';
List<NotificationEntity> parseNotification(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<NotificationEntity>((json) => NotificationEntity.fromJson(json)).toList();
}
class NotificationEntity {
  String ?id;
  bool ?isRead;
  String ?createdAt;
  NotificationEntity({
    this.id,
    this.isRead,
    this.createdAt,
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) => NotificationEntity(
    id: json["id"],
    isRead: json["isRead"],
    createdAt:json["createdAt"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isRead":isRead,
    "createdAt":createdAt,
  };

  @override
  String toString() {
    return 'NotificationEntity{id: $id, isRead: $isRead, createdAt: $createdAt}';
  }
}
