import 'dart:core';

class UserEntity {
  int? id;
  String? name;
  String? avatar;
  String? email;
  String? password;
  String? role;

  UserEntity({
    this.id,
    this.name,
    this.avatar,
    this.email,
    this.role,
    this.password,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"]?? "",
        email: json["email"]??"",
        password: json["password"]??"",
        name: json["name"]??"",
        role: json["role"]??"",
        avatar: json["avatar"]??"",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "role": role,
        "avatar": avatar,
      };

}
