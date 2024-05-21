import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static String userToken = 'userToken';
  static String studentImage = 'studentImage';
  static String studentName = 'studentName';
  static String userName = 'userName';

  static Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  UserPreferences();

  static Future<String> getUserToken() async {
    return (await sharedPreferences).getString(userToken) ?? '';
  }

  static setUserToken(String token) async {
    (await sharedPreferences).setString(userToken, token);
  }

  static Future<String> getInstituteId() async {
    return (await sharedPreferences).getString("InstituteId") ?? '';
  }

  static setInstituteId(String token) async {
    (await sharedPreferences).setString("InstituteId", token);
  }

  static Future<String> getInstituteName() async {
    return (await sharedPreferences).getString("InstituteName") ?? '';
  }

  static setInstituteName(String token) async {
    (await sharedPreferences).setString("InstituteName", token);
  }

  static Future<String> getStudentId() async {
    return (await sharedPreferences).getString("studentId") ?? '';
  }

  static Future<String> getStaffId() async {
    return (await sharedPreferences).getString("staffId") ?? '';
  }

  static setStudentId(String token) async {
    (await sharedPreferences).setString('studentId', token);
  }

  static Future<String> getAdminId() async {
    return (await sharedPreferences).getString("adminId") ?? '';
  }

  static setAdminId(String token) async {
    (await sharedPreferences).setString('adminId', token);
  }

  static setStaffId(String token) async {
    (await sharedPreferences).setString('staffId', token);
  }

  static Future<String> getStudentMobileNo() async {
    return (await sharedPreferences).getString("StudentMobileNo") ?? '';
  }

  static setStudentMobileNo(String token) async {
    (await sharedPreferences).setString('StudentMobileNo', token);
  }

  static Future<String> getStudentEmail() async {
    return (await sharedPreferences).getString("StudentEmail") ?? '';
  }

  static setStudentEmail(String token) async {
    (await sharedPreferences).setString('StudentEmail', token);
  }

  static Future<String> getStudentImage() async {
    final prefs = await sharedPreferences;
    return prefs.getString(studentImage) ?? '';
  }

  static setStudentImage(String? image) async {
    final prefs = await sharedPreferences;
    prefs.setString(studentImage, image ?? '');
  }

  static Future<String> getStudentName() async {
    final prefs = await sharedPreferences;
    return prefs.getString(studentName) ?? '';
  }

  static setStudentName(String image) async {
    final prefs = await sharedPreferences;
    prefs.setString(studentName, image);
  }

  static Future<String> getUserName() async {
    final prefs = await sharedPreferences;
    return prefs.getString(userName) ?? '';
  }

  static setUserName(String name) async {
    final prefs = await sharedPreferences;
    prefs.setString(userName, name);
  }

  static Future<bool> getIsStaffLogin() async {
    final prefs = await sharedPreferences;
    return prefs.getBool("IsStaffLogin") ?? false;
  }

  static setIsStaffLogin(bool name) async {
    final prefs = await sharedPreferences;
    prefs.setBool("IsStaffLogin", name);
  }

  static clearData() async {
    final prefs = await sharedPreferences;
    prefs.clear();
  }
}
