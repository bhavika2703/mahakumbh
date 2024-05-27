import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static String userId = 'userId';

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


  static clearData() async {
    final prefs = await sharedPreferences;
    prefs.clear();
  }
}
