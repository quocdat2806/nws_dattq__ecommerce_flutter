import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/database/shared_preferences_helper.dart';

part 'app_setting_state.dart';

Future<String> getDefaultLanguage() async {
  String value = await SharedPreferencesHelper.getDefaultLanguage();
  return value;
}

class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit() : super(const AppSettingState());

  void changeViLanguage() {
    emit(
      state.copyWith(language: 'vi', isChangeLanguage: true),
    );
  }

  void changeEnLanguage() {
    emit(
      state.copyWith(language: 'en', isChangeLanguage: true),
    );
  }

  void setDefaultLanguage() async {
    String language = await getDefaultLanguage();
    emit(
      state.copyWith(
        language: language,
        isSaveLanguage: true,
      ),
    );
  }

  void saveLanguage() async {
    String language = await SharedPreferencesHelper.getDefaultLanguage();
    if (language == state.language) {
      return;
    }
    await SharedPreferencesHelper.setDefaultLanguage(language: state.language);
    emit(
      state.copyWith(
        isSaveLanguage: false,
      ),
    );
    emit(
      state.copyWith(
        isSaveLanguage: true,
        isChangeLanguage: false,
      ),
    );
  }
}
