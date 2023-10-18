import 'package:newware_final_project/models/entities/cart/cart_entity.dart';
import 'package:newware_final_project/models/entities/notification/notification_entity.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:newware_final_project/networks/resources/user/user_provider.dart';

abstract class UserResponsitory{
  Future<UserEntity?>getProfile(String token);
  Future<void> updateProfile(UserEntity ?userEntity);
  Future<Map<String,dynamic>?> addToCart(CartEntity ?cartEntity);
  Future<Map<String,dynamic>?> checkoutCart(List<CartEntity>list);

  Future<List<CartEntity>?> getCart(userId);
  Future<void> deleteCart( int userId,String cartId);
  Future<List<NotificationEntity>?> getNotify(userId);
  Future<void> deleteAllNotify( int userId);



}
class UserResponsitoryImpl extends UserResponsitory{
  final userProvider = UserProvider();
  @override
  Future<UserEntity?> getProfile(String token) {
    return userProvider.getProfile(token);
  }

  @override
  Future<void> updateProfile(UserEntity? userEntity) {
    // TODO: implement updateProfile
    throw UnimplementedError();
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
  Future<void> deleteCart(userId,cartId) {
    return userProvider.deleteCart(userId,cartId);
  }

  @override
  Future<void> deleteAllNotify(int userId) {
    // TODO: implement deleteAllNotify
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>?> getNotify(userId) {
    return userProvider.getNotify(userId);
  }

  @override
  Future<Map<String, dynamic>?> checkoutCart(List<CartEntity> list) {
    return userProvider.checkoutCart(list);
  }




}