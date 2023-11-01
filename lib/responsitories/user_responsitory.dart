import 'package:newware_final_project/models/entities/cart/cart_entity.dart';
import 'package:newware_final_project/models/entities/notification/notification_entity.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:newware_final_project/networks/resources/user/user_provider.dart';

abstract class UserResponsitory{
  Future<UserEntity?>getProfile(String token);
  Future<Map<String,dynamic>?> addToCart(CartEntity ?cartEntity);
  Future<Map<String,dynamic>?> checkoutCart(List<CartEntity>list);
  Future<List<CartEntity>?> getCart(userId);
  Future<void> updateCartWhenClosePage(List<CartEntity>list);

  Future<List<NotificationEntity>?> getNotify(userId);

}
class UserResponsitoryImpl extends UserResponsitory{
  final userProvider = UserProvider();
  @override
  Future<UserEntity?> getProfile(String token) {
    return userProvider.getProfile(token);
  }


  @override
  Future<Map<String,dynamic>?> addToCart(CartEntity ?cartEntity) {
    return userProvider.addToCart(cartEntity!);
  }

  @override
  Future<List<CartEntity>?> getCart(userId) {
   return userProvider.getCart(userId);
  }





  @override
  Future<List<NotificationEntity>?> getNotify(userId) {
    return userProvider.getNotify(userId);
  }

  @override
  Future<Map<String, dynamic>?> checkoutCart(List<CartEntity> list) {
    return userProvider.checkoutCart(list);
  }

  @override
  Future<void> updateCartWhenClosePage(List<CartEntity>list) {
    return userProvider.updateCartWhenClosePage(list);
  }

}