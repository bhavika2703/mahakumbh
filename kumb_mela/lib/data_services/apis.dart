import 'dart:developer';

import '../utility/shared_preferences.dart';

class KumbhApi {
  static String baseUrl = "";

  // static String getFinalBaseUrl = ;

  static getToken() async {
    String accessToken = await UserPreferences.getUserToken();
    return accessToken;
  }

}

void kPrint(s) {
  log(s.toString());
}

String getIdsFromList(List list) {
  return list.toString().replaceAll("[", "").replaceAll("]", "");
}
