

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/bloc/setting/app_setting_cubit.dart';
import 'package:newware_final_project/ui/pages/change_language/language_state.dart';


class LanguageCubit extends Cubit<LanguageState> {

  final AppCubit appCubit;
  final AppSettingCubit settingCubit;
  LanguageCubit({
    required this.appCubit,
    required this.settingCubit,
  }) : super( LanguageState());

  void changeViLanguage(){
      settingCubit.changeViLanguage();
  }
  void changeEnLanguage(){
    settingCubit.changeEnLanguage();
  }
  void saveSetting() {
    settingCubit.saveLanguage();
  }


}
