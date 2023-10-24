import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/models/entities/user/user_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/auth_responsitory.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'package:newware_final_project/ui/pages/auth/signin/singin_navigator.dart';
import 'package:newware_final_project/ui/pages/auth/signin/singin_state.dart';
import 'package:newware_final_project/utils/utils.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInNavigator navigator;
  final AuthResponsitory authRepo;
  final UserResponsitory userRepo;
  final AppCubit appCubit;

  SignInCubit({
    required this.navigator,
    required this.authRepo,
    required this.userRepo,
    required this.appCubit,
  }) : super(const SignInState());

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
  void signInWithGoogle(){
    emit(
      state.copyWith(
        signInStatus: LoadStatus.loading,
      ),
    );

  }
  void onTabShowAndHideIcon(){
    bool isHide = !state.isShowOrHidePassword;
    emit(state.copyWith(isShowOrHidePassword: isHide));
  }
  void signIn() async {
    String email = state.email ?? '';
    String password = state.password ?? '';
    emit(
      state.copyWith(
        signInStatus: LoadStatus.loading,
      ),
    );
    try {
      final tokenEntity = await authRepo.singIn(
        email,
        password,
      );
      if (tokenEntity != null) {
        await authRepo.saveToken(tokenEntity);
        UserEntity? userEntity = await userRepo.getProfile(
          tokenEntity.accessToken,
        );
        await appCubit.updateProfile(userEntity!);
        navigator.openMainPage();
      } else {
        emit(
          state.copyWith(
            signInStatus: LoadStatus.failure,
          ),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
          signInStatus: LoadStatus.failure,
        ),
      );
    }
  }
}
