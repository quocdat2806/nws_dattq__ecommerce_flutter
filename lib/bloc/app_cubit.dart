import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:newware_final_project/repositories/auth_responsitory.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';

import '../models/enums/load_status.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  UserResponsitory userRepo;
  AuthResponsitory authRepo;

  AppCubit({
    required this.userRepo,
    required this.authRepo,
  }) : super(const AppState());

  Future<UserEntity?> getProfile(String token) async {
    try {
      final result = await userRepo.getProfile(token);
      emit(
        state.copyWith(getProfileStatus: LoadStatus.loading),
      );
      return result;
    } catch (e) {
      emit(
        state.copyWith(getProfileStatus: LoadStatus.failure),
      );
    }
    return null;
  }
  Future<void> updateProfile(UserEntity userProfile) async {
    emit(state.copyWith(updateProfileStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(
        user:userProfile,
        updateProfileStatus: LoadStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(signOutStatus: LoadStatus.failure));
    }
  }
  Future<void> signOut() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await authRepo.removeToken();
      emit(state.removeUser().copyWith(signOutStatus: LoadStatus.success));
    } catch (e) {
      emit(state.copyWith(signOutStatus: LoadStatus.failure));
    }
  }
}
