import 'package:newware_final_project/models/entities/category/category_entity.dart';
import 'package:newware_final_project/networks/resources/category/category_provider.dart';

abstract class CategoryResponsitory{
  Future<List<CategoryEntity>?>getAllCategory();
}
class CategoryResponsitoryImpl extends CategoryResponsitory{
  final categoryProvider = CategoryProvider();
  @override
  Future<List<CategoryEntity>?> getAllCategory() {
    return  categoryProvider.getAllCategory();
  }
}