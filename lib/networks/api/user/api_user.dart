
class ApiUser{

  static const String rootApi = 'https://backend-newware.onrender.com';
  static const String getProfile = 'https://api.escuelajs.co/api/v1/auth/profile';
  static const String addToCart = '$rootApi/addToCart';
  static const String checkOutCart = '$rootApi/checkoutCart';
  static const String updateCart = '$rootApi/updateCart';
  static String getCart(int userId)=>'$rootApi/cart/:$userId';
  static String getNotify(int userId)=>'$rootApi/notify/:$userId';
}