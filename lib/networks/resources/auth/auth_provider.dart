import 'dart:convert';
import 'dart:io';
import 'package:newware_final_project/models/entities/token/token_entity.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:http/http.dart' as http;
import 'package:newware_final_project/networks/api/auth/api_auth.dart';
import 'package:newware_final_project/networks/config/config_header_request_api.dart';

class AuthProvider {

  Future<UserEntity?> singUp(
    String name,
    String email,
    String password,
  ) async {
    var userInfo = {
      "name": name,
      "email": email,
      "password": password,
      "avatar": "https://api.lorem.space/image/face?w=640&h=480",
    };
    var endcodedUserInfo = jsonEncode(userInfo);

    try {
      var response = await http.post(
        Uri.parse(
          ApiAuth.singUp,
        ),
        body: endcodedUserInfo,
        headers: ConfigHeaderRequestApi.requestHeaders,
      );
      if (response.statusCode == HttpStatus.CREATED ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        final userEntity = UserEntity.fromJson(jsonDecode(response.body));
        return userEntity;
      } else if (response.statusCode == HttpStatus.NOT_FOUND) {
        throw (Exception("Sing up failed"));
      } else {
        throw (Exception(''));
      }
    } catch (e) {
      throw (Exception(e));
    }
  }

  Future<TokenEntity?> singIn(
    String email,
    String password,
  ) async {
    var userInfor = {
      "email": email,
      "password": password,
    };
    var endcodedUserInfor = jsonEncode(userInfor);
    try {
      var response = await http.post(
        Uri.parse(
          ApiAuth.singIn,
        ),
        headers: ConfigHeaderRequestApi.requestHeaders,
        body: endcodedUserInfor,
      );
      if (response.statusCode == HttpStatus.CREATED ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        final tokenEntity = TokenEntity.fromJson(jsonDecode(response.body));
        return tokenEntity;
      } else if (response.statusCode == HttpStatus.NOT_FOUND) {
        throw (Exception("Can't find the user with id:"));
      } else {
        throw (Exception(''));
      }
    } catch (e) {
      throw (Exception(e));
    }
  }
}
