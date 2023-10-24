import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/database/shared_preferences_helper.dart';

part 'app_setting_state.dart';
Future<String> getDefaultLanguage()async{
  String value =  await SharedPreferencesHelper.getDefaultLanguage();
  return value;
}
class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit() : super(const AppSettingState());
  void changeViLanguage(){
    emit(state.copyWith(language: 'vi',isChange: true),);
  }
  void changeEnLanguage(){
    emit(state.copyWith(language: 'en',isChange: true),);
  }
  void setDefaultLanguage()async{
    String language = await getDefaultLanguage();
    emit(state.copyWith(language: language,isSave: true),);
  }
  void saveSetting(){
    emit(state.copyWith(isSave: false));
    Future.delayed(const Duration(seconds: 1),(){
      emit(state.copyWith(isSave: true,isChange: false),);
    });
  }


}
