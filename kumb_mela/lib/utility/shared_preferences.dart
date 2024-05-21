import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static String userToken = 'userToken';
  static String studentImage = 'studentImage';
  static String studentName = 'studentName';
  static String userName = 'userName';
  static String fireUserId = 'fireUserId';

  static Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();

  UserPreferences();

  static Future<String> getUserToken() async {
    return (await sharedPreferences).getString(userToken) ?? '';
  }

  static setUserToken(String token) async {
    (await sharedPreferences).setString(userToken, token);
  }

  static Future<String> getSpecialization() async {
    return (await sharedPreferences).getString("specialization") ?? '';
  }

  static setSpecialization(String token) async {
    (await sharedPreferences).setString("specialization", token);
  }

  static Future<String> getExperience() async {
    return (await sharedPreferences).getString("experience") ?? '';
  }

  static setExperience(String token) async {
    (await sharedPreferences).setString("experience", token);
  }

  static Future<String> getDegree() async {
    return (await sharedPreferences).getString("degree") ?? '';
  }

  static setDegree(String token) async {
    (await sharedPreferences).setString("degree", token);
  }

  static Future<String> getRevisitDays() async {
    return (await sharedPreferences).getString("revisitdays") ?? '';
  }

  static setRevisitDays(String token) async {
    (await sharedPreferences).setString("revisitdays", token);
  }

  static Future<String> getAge() async {
    return (await sharedPreferences).getString("age") ?? '';
  }

  static setAge(String token) async {
    (await sharedPreferences).setString("age", token);
  }

  static Future<String> getGender() async {
    return (await sharedPreferences).getString("gender") ?? '';
  }

  static setGender(String token) async {
    (await sharedPreferences).setString("gender", token);
  }

  static Future<String> getAddress() async {
    return (await sharedPreferences).getString("address") ?? '';
  }

  static setAddress(String token) async {
    (await sharedPreferences).setString("address", token);
  }

  static Future<String> getFireID() async {
    return (await sharedPreferences).getString("fireID") ?? '';
  }

  static setFireID(String token) async {
    (await sharedPreferences).setString("fireID", token);
  }

  static Future<String> getConsultOnlineID() async {
    return (await sharedPreferences).getString("consultOnline") ?? '';
  }

  static setConsultOnlineID(String token) async {
    (await sharedPreferences).setString("consultOnline", token);
  }

  static Future<String> getDoctorId() async {
    return (await sharedPreferences).getString("doctorID") ?? '';
  }

  static setDoctorId(String token) async {
    (await sharedPreferences).setString('doctorID', token);
  }

  static Future<String> getUserType() async {
    return (await sharedPreferences).getString("userType") ?? '';
  }

  static setUserType(String token) async {
    (await sharedPreferences).setString('userType', token);
  }

  static Future<String> getAdminId() async {
    return (await sharedPreferences).getString("adminId") ?? '';
  }

  static setAdminId(String token) async {
    (await sharedPreferences).setString('adminId', token);
  }

  static Future<String> getDoctorMobileNo() async {
    return (await sharedPreferences).getString("DoctorMobileNo") ?? '';
  }

  static setDoctorMobileNo(String token) async {
    (await sharedPreferences).setString('DoctorMobileNo', token);
  }

  static Future<String> getUserEmail() async {
    return (await sharedPreferences).getString("UserEmail") ?? '';
  }

  static setUserEmail(String token) async {
    (await sharedPreferences).setString('UserEmail', token);
  }

  static Future<String> getUserImage() async {
    final prefs = await sharedPreferences;
    return prefs.getString(studentImage) ?? '';
  }

  static setUserImage(String? image) async {
    final prefs = await sharedPreferences;
    prefs.setString(studentImage, image ?? '');
  }

  static Future<String> getUserName() async {
    final prefs = await sharedPreferences;
    return prefs.getString(studentName) ?? '';
  }

  static setUserName(String image) async {
    final prefs = await sharedPreferences;
    prefs.setString(studentName, image);
  }

  // static Future<String> getUserName() async {
  //   final prefs = await sharedPreferences;
  //   return prefs.getString(userName) ?? '';
  // }
  //
  // static setUserName(String name) async {
  //   final prefs = await sharedPreferences;
  //   prefs.setString(userName, name);
  // }
  static Future<String> getUserId() async {
    final prefs = await sharedPreferences;
    return prefs.getString(fireUserId) ?? '';
  }

  static setUserId(String? id) async {
    final prefs = await sharedPreferences;
    prefs.setString(fireUserId, id ?? '');
  }

  static Future<bool> getIsDoctorLogin() async {
    final prefs = await sharedPreferences;
    return prefs.getBool("IsDoctorLogin") ?? false;
  }

  static setIsDoctorLogin(bool name) async {
    final prefs = await sharedPreferences;
    prefs.setBool("IsDoctorLogin", name);
  }

  static clearData() async {
    final prefs = await sharedPreferences;
    prefs.clear();
  }
}
