import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/database/shared_preferences_helper.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/auth_responsitory.dart';

import 'splash_navigator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashNavigator navigator;
  final AuthResponsitory authRepo;
  final AppCubit appCubit;

  SplashCubit({
    required this.navigator,
    required this.authRepo,
    required this.appCubit,
  }) : super(const SplashState());

  void checkLogin() async {
    final tokenEntity = await authRepo.getToken();
    if (tokenEntity == null) {
      if (await SharedPreferencesHelper.isOnboardCompleted()) {
        navigator.openAuthPage();
      } else {
        navigator.openOnboardingPage();
      }
    } else {
      try {
        UserEntity? userEntity =
            await appCubit.getProfile(tokenEntity.accessToken);
        if (userEntity != null) {
          await appCubit.updateProfile(userEntity);
          navigator.openMainPage();
        } else {
          if (await SharedPreferencesHelper.isOnboardCompleted()) {
            navigator.openAuthPage();
          } else {
            navigator.openOnboardingPage();
          }
        }
      } catch (error, s) {
        throw (error, s);
      }
    }
  }
}
