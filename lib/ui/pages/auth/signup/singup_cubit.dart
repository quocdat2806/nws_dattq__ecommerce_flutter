import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/models/entities/token/token_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/auth_responsitory.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'package:newware_final_project/ui/pages/auth/signup/singup_state.dart';
import 'package:newware_final_project/utils/utils.dart';
import 'singup_navigator.dart';

class SingUpCubit extends Cubit<SingUpState> {
  final SignUpNavigator navigator;
  final AuthResponsitory authRepo;
  final UserResponsitory userRepo;
  final AppCubit appCubit;

  SingUpCubit({
    required this.navigator,
    required this.authRepo,
    required this.userRepo,
    required this.appCubit,
  }) : super(const SingUpState());

  void changeName({required String name}) {
    bool invalidate = name.length >= 4;
    if (name.isEmpty) {
      emit(
        state.copyWith(
          name: name,
          nameStatus: StatusInput.initial,
        ),
      );
    } else if (invalidate) {
      emit(
        state.copyWith(
          name: name,
          nameStatus: StatusInput.validName,
        ),
      );
    } else {
      emit(
        state.copyWith(
          name: name,
          nameStatus: StatusInput.inValidName,
        ),
      );
    }
  }

  void onTabShowAndHidePassword() {
    bool isHidePassword = !state.isHideOrShowPassword;
    emit(state.copyWith(isHideOrShowPassword: isHidePassword));
  }

  void onTabShowAndHideConfirmPassword() {
    bool isHideConfirmPassword = !state.isHideOrShowConfirmPassword;
    emit(state.copyWith(isHideOrShowConfirmPassword: isHideConfirmPassword));
  }

  void changeConfirmPassword({
    required String confirmPassword,
  }) {
    bool invalidate = Utils.isPassword(confirmPassword);

    if (confirmPassword.isEmpty) {
      emit(
        state.copyWith(
          confirmPassword: confirmPassword,
          confirmPasswordStatus: StatusInput.initial,
        ),
      );
    } else if (invalidate) {
      emit(
        state.copyWith(
          confirmPassword: confirmPassword,
          confirmPasswordStatus: StatusInput.validConfirmPassword,
        ),
      );
    } else {
      emit(
        state.copyWith(
          confirmPassword: confirmPassword,
          confirmPasswordStatus: StatusInput.inValidConfirmPassword,
        ),
      );
    }
  }

  void changeEmail({required String email}) {
    bool invalidate = Utils.isEmail(email);
    if (email.isEmpty) {
      emit(
        state.copyWith(
          email: email,
          emailStatus: StatusInput.initial,
        ),
      );
    } else if (invalidate) {
      emit(
        state.copyWith(
          email: email,
          emailStatus: StatusInput.validEmail,
        ),
      );
    } else {
      emit(
        state.copyWith(
          email: email,
          emailStatus: StatusInput.inValidEmail,
        ),
      );
    }
  }

  void changePassword({required String password}) {
    bool invalidate = Utils.isPassword(password);
    if (password.isEmpty) {
      emit(
        state.copyWith(
          password: password,
          passwordStatus: StatusInput.initial,
        ),
      );
    } else if (invalidate) {
      emit(
        state.copyWith(
          password: password,
          passwordStatus: StatusInput.validPassword,
        ),
      );
    } else {
      emit(
        state.copyWith(
          password: password,
          passwordStatus: StatusInput.inValidPassword,
        ),
      );
    }
  }

  void switchCheckboxStatus() {
    emit(
      state.copyWith(checkProxy: !state.checkProxy),
    );
  }

  void singUp() async {
    String email = state.email ?? '';
    String password = state.password ?? '';
    String name = state.name ?? '';

    emit(
      state.copyWith(
        signUpStatus: LoadStatus.loading,
      ),
    );
    try {
      final result = await authRepo.singUp(
        name,
        email,
        password,
      );
      if (result != null) {
        TokenEntity? tokenEntity = await authRepo.singIn(
          email,
          password,
        );

        await authRepo.saveToken(tokenEntity!);
        await appCubit.updateProfile(result);
        navigator.openSuccessPage();
      } else {
        emit(
          state.copyWith(
            signUpStatus: LoadStatus.failure,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          signUpStatus: LoadStatus.failure,
        ),
      );
    }
  }
}
