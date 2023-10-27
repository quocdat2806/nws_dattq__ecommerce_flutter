part of 'app_setting_cubit.dart';

late String defaultLanguage ;
class AppSettingState extends Equatable {
  final String language;
  final bool isSaveLanguage;
  final bool isChangeLanguage;
  const AppSettingState({ this.language='en',this.isSaveLanguage = false,this.isChangeLanguage=false});
  @override
  // TODO: implement props
  List<Object?> get props => [language,isSaveLanguage,isChangeLanguage];

  AppSettingState copyWith({
    String? language,
    bool? isSaveLanguage,
    bool? isChangeLanguage,
  }) {
    return AppSettingState(
      language: language ?? this.language,
      isSaveLanguage: isSaveLanguage ?? this.isSaveLanguage,
      isChangeLanguage: isChangeLanguage ?? this.isChangeLanguage,
    );
  }
}
