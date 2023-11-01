import 'dart:convert';
import 'dart:io';
import 'package:newware_final_project/models/entities/cart/cart_entity.dart';
import 'package:newware_final_project/models/entities/notification/notification_entity.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:http/http.dart' as http;
import 'package:newware_final_project/networks/api/user/api_user.dart';
import 'package:newware_final_project/networks/config/config_header_request_api.dart';

class UserProvider {
  Future<UserEntity?> getProfile(
    String token,
  ) async {
    try {
      var response = await http.get(
        Uri.parse(
          ApiUser.getProfile,
        ),
        headers: ConfigHeaderRequestApi.requestHeaders(
          token: token
        ),
      );
      // ignore: deprecated_member_use
      if (response.statusCode == HttpStatus.CREATED ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        final user = jsonDecode(response.body);
        return UserEntity.fromJson(user);
      // ignore: deprecated_member_use
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
    var endcodedCartEntity = jsonEncode(cartEntity);
    try {
      var response = await http.post(
          Uri.parse(
            ApiUser.addToCart,
          ),
          headers: ConfigHeaderRequestApi.requestHeaders(),
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

    var endcodedCartEntity = jsonEncode(list);
    try {
      var response = await http.post(
        Uri.parse(
          ApiUser.checkOutCart,
        ),
        headers: ConfigHeaderRequestApi.requestHeaders(),
        body: endcodedCartEntity,
      );
      var responseStatus = jsonDecode(response.body);
      if (responseStatus['statusCode'] == 200) {
        return responseStatus;
      // ignore: deprecated_member_use
      } else if (response.statusCode == HttpStatus.NOT_FOUND) {
        throw (Exception("check out err "));
      } else {
        throw (Exception(''));
      }
    } catch (e) {
      throw (Exception(e));
    }
  }
  Future<Map<String, dynamic>?> updateCartWhenClosePage(List<CartEntity> list) async {
    var endcodedCartEntity = jsonEncode(list);
    try {
      var response = await http.post(
        Uri.parse(
          ApiUser.updateCart,
        ),
        headers: ConfigHeaderRequestApi.requestHeaders(),
        body: endcodedCartEntity,
      );
      var responseStatus = jsonDecode(response.body);
      if (responseStatus['statusCode'] == 200) {
        return responseStatus;
        // ignore: deprecated_member_use
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
    try {
      var response = await http.get(
        Uri.parse(
          ApiUser.getCart(userId),
        ),
        headers: ConfigHeaderRequestApi.requestHeaders(),
      );
      List<CartEntity> cartList = parseCart(response.body);
      return cartList;
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<List<NotificationEntity>?> getNotify(int userId) async {

    try {
      var response = await http.get(
        Uri.parse(
          ApiUser.getNotify(userId),
        ),
        headers: ConfigHeaderRequestApi.requestHeaders(),
      );
      List<NotificationEntity> cartNotify = parseNotification(response.body);
      return cartNotify;
    } catch (e) {

      throw (Exception(e));
    }
  }

  Future<UserEntity?> updateProfile(String token) async {
    try {
      var response = await http.get(
        Uri.parse(
          ApiUser.getProfile,
        ),
        headers: ConfigHeaderRequestApi.requestHeaders(
          token: token
        ),
      );
      // ignore: deprecated_member_use
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
}
