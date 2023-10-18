class CategoryEntity {
  int? id;
  String? name;
  String? image;
  int? totalProduct;

  CategoryEntity({
     this.id,
     this.name,
     this.image,
     this.totalProduct = 0,
  });

  factory CategoryEntity.fromJson(Map<String, dynamic> json) => CategoryEntity(
        id: json["id"]??0,
        name: json["name"]??'',
        image: json["image"]??'',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
