import 'dart:convert';
import 'dart:io';
import 'package:newware_final_project/models/entities/product/product_entity.dart';
import 'package:http/http.dart' as http;
import 'package:newware_final_project/networks/api/product/api_product.dart';

class ProductProvider {
  Future<List<ProductEntity>?> getProductsInCategory(
      int categoryId, int offset) async {
    try {
      var response = await http.get(
        Uri.parse(
          ApiProduct.getProductsInCategory(categoryId, offset: offset),
        ),
      );
      if (response.statusCode == HttpStatus.created ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        List<ProductEntity> productList = parseProducts(response.body);
        return productList;
      } else if (response.statusCode == HttpStatus.notFound) {
        throw (Exception("err"),);
      } else {
        throw (Exception(''),);
      }
    } catch (e) {
      throw (Exception(e),);
    }
  }

  Future<ProductEntity?> getProductById(int productId) async {
    try {
      var response = await http.get(
        Uri.parse(
          ApiProduct.getProductById(productId),
        ),
      );
      if (response.statusCode == HttpStatus.created ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        ProductEntity productEntity = ProductEntity.fromJson(
          jsonDecode(response.body),
        );
        return productEntity;
      } else if (response.statusCode == HttpStatus.notFound) {
        throw (Exception("err"),);
      } else {
        throw (Exception(''),);
      }
    } catch (e) {
      throw (Exception(e),);
    }
  }
}
