import 'dart:convert';

import 'package:newware_final_project/models/entities/product/product_entity.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';

List<CartEntity> parseCart(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<CartEntity>((json) => CartEntity.fromJson(json)).toList();
}

class CartEntity {
  String ?id;
  UserEntity? userEntity;
  ProductEntity? productEntity;
  int? quantity;
  int? total;
  String? image;

  CartEntity({
    this.userEntity,
    this.productEntity,
    this.quantity,
    this.total,
    this.image,
    this.id,
  });
  factory CartEntity.fromJson(Map<String, dynamic> json) => CartEntity(
        id: json["_id"],
        userEntity: UserEntity.fromJson(json["userEntity"]),
        productEntity: ProductEntity.fromJson(json["productEntity"]),
        quantity: json["quantity"],
        total: json["total"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userEntity": userEntity?.toJson(),
        "productEntity": productEntity?.toJson(),
        "quantity": quantity,
        "total": total,
        "image": image,
      };

  @override
  String toString() {
    return 'CartEntity{id: $id, userEntity: $userEntity, productEntity: $productEntity, quantity: $quantity, total: $total, image: $image}';
  }
}
