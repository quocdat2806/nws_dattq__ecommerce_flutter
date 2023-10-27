

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/bloc/setting/app_setting_cubit.dart';
import 'package:newware_final_project/database/shared_preferences_helper.dart';
import 'package:newware_final_project/ui/pages/language/language_state.dart';


class LanguageCubit extends Cubit<LanguageState> {

  final AppCubit appCubit;
  final AppSettingCubit settingCubit;
  LanguageCubit({
    required this.appCubit,
    required this.settingCubit,
  }) : super( LanguageState());

  void changeViLanguage({isSave}){
      settingCubit.changeViLanguage();
  }
  void changeEnLanguage({isSave}){
    settingCubit.changeEnLanguage();
  }
  void saveSetting({language='en'}){
    settingCubit.saveLanguage();
    SharedPreferencesHelper.setDefaultLanguage(language:language );
  }

}
