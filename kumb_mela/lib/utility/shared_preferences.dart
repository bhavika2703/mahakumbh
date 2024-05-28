import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static String userId = 'userId';
  static String colorTheme = 'colorTheme';

  static Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  UserPreferences();

  static Future<String> getUserId() async {
    final prefs = await sharedPreferences;
    return prefs.getString(userId) ?? '';
  }

  static setUserId(String name) async {
    final prefs = await sharedPreferences;
    prefs.setString(userId, name);
  }

  static Future<bool> getUColorTheme() async {
    final prefs = await sharedPreferences;
    return prefs.getBool(colorTheme) ?? false;
  }

  static setColorTheme(bool name) async {
    final prefs = await sharedPreferences;
    prefs.setBool(colorTheme, name);
  }

  // static Future<bool> getIsStudentLogin() async {
  //   final prefs = await sharedPreferences;
  //   return prefs.getBool(isStudentLogin) ?? false;
  // }
  //
  // static setIsStudentLogin(bool b) async {
  //   final prefs = await sharedPreferences;
  //   prefs.setBool(isStudentLogin, b);
  // }

  static clearData() async {
    final prefs = await sharedPreferences;
    prefs.clear();
  }
}
