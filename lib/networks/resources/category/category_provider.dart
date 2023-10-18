import 'package:newware_final_project/models/entities/category/category_entity.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:newware_final_project/networks/api/category/api_category.dart';
class CategoryProvider {
  Future<List<CategoryEntity>?> getAllCategory() async {
    try {
      var response = await http.get(
        Uri.parse(
          ApiCategory.getAllCategory,
        ),
      );
      if (response.statusCode == HttpStatus.CREATED ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        Iterable iter = jsonDecode(response.body);
        List<CategoryEntity> listCategory = iter.map((category) {
          return CategoryEntity(
            id: category['id'] ?? '',
            name: category['name'] ?? '',
            image: category['image'] ?? '',
          );
        },).toList();
        final futures = listCategory.map((e) =>
            getLengthProductsInCategory(e.id!)
        );
        final productCountingList = await Future.wait(futures);
        for(int categoryIndex = 0; categoryIndex < listCategory.length; categoryIndex++){
         listCategory[categoryIndex].totalProduct = productCountingList[categoryIndex];
        }
        listCategory = listCategory.where((element) => element.totalProduct != 0).toList();
        return listCategory;
      } else {
        throw (Exception('Error'),);
      }
    } catch (e) {
      throw (Exception(e),);
    }
  }
  Future<int> getLengthProductsInCategory(int id,) async {
    try {
      var response = await http.get(
        Uri.parse(
          ApiCategory.getLengthProductsInCategory(id),
        ),
      );
      if (response.statusCode == HttpStatus.CREATED ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        return jsonDecode(response.body).length;
      } else if (response.statusCode == HttpStatus.NOT_FOUND) {
        throw (Exception("err"),);
      } else {
        throw (Exception(''),);
      }
    } catch (e) {
      throw (Exception(e),);
    }
  }
}
