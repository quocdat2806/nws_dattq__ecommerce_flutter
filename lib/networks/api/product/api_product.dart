class ApiProduct {
  static String getProductsInCategory(int categoryId) =>
      'https://api.escuelajs.co/api/v1/categories/$categoryId/products';
  static String getProductById(int productId) =>
      'https://api.escuelajs.co/api/v1/products/$productId';
}
