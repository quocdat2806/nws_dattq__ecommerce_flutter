class ApiCategory {
  static const String getAllCategory =
      'https://api.escuelajs.co/api/v1/categories?offset=0&limit=20';

  static String getLengthProductsInCategory(int idCategory) =>
      'https://api.escuelajs.co/api/v1/categories/$idCategory/products';
}
