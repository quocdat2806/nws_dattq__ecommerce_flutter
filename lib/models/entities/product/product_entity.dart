import 'dart:convert';
import 'package:newware_final_project/models/entities/category/category_entity.dart';

List<ProductEntity> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<ProductEntity>((json) => ProductEntity.fromJson(json))
      .toList();
}

class ProductEntity {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  CategoryEntity? category;

  ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.category,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        price: json["price"] ?? 0,
        description: json["description"] ?? "",
        images: json["images"] != null
            ? List<String>.from(json["images"].map((x) => x))
            : [],
        category: json["category"] != null
            ? CategoryEntity.fromJson(json["category"] ?? "")
            : CategoryEntity(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "category": category!.toJson(),
      };
}
