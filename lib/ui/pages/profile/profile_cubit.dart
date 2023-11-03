import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/ui/pages/profile/profile_navigator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  final ProfileNavigator navigator;
  final AppCubit appCubit;
  ProfileCubit({
    required this.navigator,
    required this.appCubit,
  }) : super( ProfileState());

  void handleSingOut()async{
    await appCubit.signOut();
    navigator.openAuthPage();
  }
  void openLanguagePage() {
    navigator.openLanguagePage();
  }
}
