
class ApiUser{
  static const String getProfile = 'https://api.escuelajs.co/api/v1/auth/profile';
  static const String addToCart = 'http://192.168.29.77:3000/addToCart';
  static const String checkOutCart = 'http://192.168.29.77:3000/checkoutCart';
  static String getCart(int userId)=>'http://192.168.29.77:3000/cart/:$userId';
  static String getNotify(int userId)=>'http://192.168.29.77:3000/notify/:$userId';
  static String deleteCart(int userId,String cartId)=>'http://192.168.29.77:3000/cart/delete/:id';
}