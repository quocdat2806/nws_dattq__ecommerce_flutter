class ApiProduct {
  static String getProductsInCategory(int categoryId, {offset = 0}) =>
      'https://api.escuelajs.co/api/v1/categories'
      '/$categoryId/products?offset=$offset&limit=10';

  static String getProductById(int productId) =>
      'https://api.escuelajs.co/api/v1/products/$productId';
}
