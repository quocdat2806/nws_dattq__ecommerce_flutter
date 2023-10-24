import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesHelper {
  static const _didOnboardKey = '_didOnboardKey';
  static Future<bool> isOnboardCompleted() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_didOnboardKey) ?? false;
    } catch (e) {
      return false;
    }
  }
  static Future<void> setOnboard({onBoard = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_didOnboardKey, onBoard ?? true);
  }
  static Future<void> setDefaultLanguage({language = 'en'}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
  }
  static Future<String> getDefaultLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value =  prefs.getString('language')??'en';
    return value;
  }

}