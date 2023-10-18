import 'package:newware_final_project/models/entities/product/product_entity.dart';
import 'package:newware_final_project/networks/resources/product/product_provider.dart';

abstract class ProductResponsitory{
  Future<List<ProductEntity>?>getProductsInCategory(int categoryId);
  Future<ProductEntity?>getProductById(int productId);
}
class ProductResponsitoryImpl extends ProductResponsitory{
  final productProvider = ProductProvider();
  @override
  Future<List<ProductEntity>?> getProductsInCategory(int categoryId) {
   return productProvider.getProductsInCategory(categoryId);
  }
  @override
  Future<ProductEntity?> getProductById(int productId) {
   return productProvider.getProductById(productId);
  }
}