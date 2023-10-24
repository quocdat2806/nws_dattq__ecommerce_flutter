part of 'app_setting_cubit.dart';

late String defaultLanguage ;
class AppSettingState extends Equatable {
  final String language;
  final bool isSave;
  final bool isChange;
  const AppSettingState({ this.language='en',this.isSave = false,this.isChange=false});
  @override
  // TODO: implement props
  List<Object?> get props => [language,isSave,isChange];

  AppSettingState copyWith({
    String? language,
    bool? isSave,
    bool? isChange,
  }) {
    return AppSettingState(
      language: language ?? this.language,
      isSave: isSave ?? this.isSave,
      isChange: isChange ?? this.isChange,
    );
  }
}
