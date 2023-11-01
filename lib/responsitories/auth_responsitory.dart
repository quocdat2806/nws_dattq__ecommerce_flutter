import 'package:newware_final_project/database/secure_storage_helper.dart';
import 'package:newware_final_project/models/entities/token/token_entity.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:newware_final_project/networks/resources/auth/auth_provider.dart';

abstract class AuthResponsitory {
  Future<TokenEntity?> getToken();

  Future<void> saveToken(
    TokenEntity tokenEntity,
  );

  Future<void> removeToken();

  Future<TokenEntity?> singIn(
    String email,
    String password,
  );

  Future<UserEntity?> singUp(
    String name,
    String email,
    String password,
  );
}

class AuthResponsitoryImpl extends AuthResponsitory {
  final authProvider = AuthProvider();

  @override
  Future<TokenEntity?> getToken()  {
    return  SecureStorageHelper.instance.getToken();
  }

  @override
  Future<void> removeToken() async{
     SecureStorageHelper.instance.removeToken();
  }

  @override
  Future<void> saveToken(TokenEntity tokenEntity) async {
    return SecureStorageHelper.instance.saveToken(tokenEntity);
  }

  @override
  Future<UserEntity?> singUp(
    String name,
    String email,
    String password,
  ) {
    return authProvider.singUp(
      name,
      email,
      password,
    );
  }

  @override
  Future<TokenEntity?> singIn(
    String email,
    String password,
  ) async {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    return authProvider.singIn(
      email,
      password,
    );
  }
}
