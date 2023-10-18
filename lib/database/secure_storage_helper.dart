import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:newware_final_project/models/entities/token/token_entity.dart';
class SecureStorageHelper {
  static const _apiTokenKey = '_apiTokenKey';
  final FlutterSecureStorage _storage;
  SecureStorageHelper._(this._storage);

  static final SecureStorageHelper _instance =
  SecureStorageHelper._(const FlutterSecureStorage());

  static SecureStorageHelper get instance => _instance;
  void saveToken(TokenEntity token) async {
    await _storage.write(key: _apiTokenKey, value: jsonEncode(token.toJson()));
  }
  void removeToken() async {
    await _storage.delete(key: _apiTokenKey);
  }
  Future<TokenEntity?> getToken() async {
    try {
      final tokenEncoded = await _storage.read(key: _apiTokenKey);
      if (tokenEncoded == null) {
        return null;
      } else {
        return TokenEntity.fromJson(
            jsonDecode(tokenEncoded) as Map<String, dynamic>);
      }
    } catch (e) {
      return null;
    }
  }
}