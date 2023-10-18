import 'dart:convert';
import 'dart:io';
import 'package:newware_final_project/models/entities/cart/cart_entity.dart';
import 'package:newware_final_project/models/entities/notification/notification_entity.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:http/http.dart' as http;
import 'package:newware_final_project/networks/api/user/api_user.dart';

class UserProvider {
  Future<UserEntity?> getProfile(
    String token,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var response = await http.get(
        Uri.parse(
          ApiUser.getProfile,
        ),
        headers: requestHeaders,
      );
      if (response.statusCode == HttpStatus.CREATED ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        final user = jsonDecode(response.body);
        return UserEntity.fromJson(user);
      } else if (response.statusCode == HttpStatus.NOT_FOUND) {
        throw (Exception("Can't find the user "));
      } else {
        throw (Exception(''));
      }
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<Map<String, dynamic>?> addToCart(CartEntity cartEntity) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var endcodedCartEntity = jsonEncode(cartEntity);
    try {
      var response = await http.post(
          Uri.parse(
            ApiUser.addToCart,
          ),
          headers: requestHeaders,
          body: endcodedCartEntity);
      var responseStatus = jsonDecode(response.body);
      if (responseStatus['statusCode'] == 200) {
        return responseStatus;
      } else if (responseStatus['statusCode'] == 400) {
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> checkoutCart(List<CartEntity> list) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var endcodedCartEntity = jsonEncode(list);
    try {
      var response = await http.post(
          Uri.parse(
            ApiUser.checkOutCart,
          ),
          headers: requestHeaders,
          body: endcodedCartEntity);
      var responseStatus = jsonDecode(response.body);
      if (responseStatus['statusCode'] == 200) {
        return responseStatus;
      } else if (response.statusCode == HttpStatus.NOT_FOUND) {
        throw (Exception("check out err "));
      } else {
        throw (Exception(''));
      }
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<List<CartEntity>?> getCart(int userId) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      var response = await http.get(
        Uri.parse(
          ApiUser.getCart(userId),
        ),
        headers: requestHeaders,
      );
      List<CartEntity> cartList = parseCart(response.body);
      return cartList;
    } catch (e) {
      print(e);
      throw (Exception(e));
    }
  }

  Future<List<NotificationEntity>?> getNotify(int userId) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      var response = await http.get(
        Uri.parse(
          ApiUser.getNotify(userId),
        ),
        headers: requestHeaders,
      );
      List<NotificationEntity> cartNotify = parseNotification(response.body);
      return cartNotify;
    } catch (e) {
      print(e);
      throw (Exception(e));
    }
  }

  Future<UserEntity?> updateProfile(String token) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var response = await http.get(
        Uri.parse(
          ApiUser.getProfile,
        ),
        headers: requestHeaders,
      );
      if (response.statusCode == HttpStatus.CREATED ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        final user = jsonDecode(response.body);
        return UserEntity.fromJson(user);
      } else {
        throw (Exception(''));
      }
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<void> deleteCart(int userId, String cartId) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      var response = await http.post(
        Uri.parse(
          ApiUser.deleteCart(userId, cartId),
        ),
        headers: requestHeaders,
      );
    } catch (e) {
      throw (Exception(e));
    }
  }
}
