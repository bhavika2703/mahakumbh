import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../colors/light_colors.dart';
import '../main.dart';
import '../theme/text_style.dart';

class ShowSnack {
  static void showErrorSnack(String msg) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      elevation: 6.0,
      backgroundColor: Colors.red.shade700,
      // behavior: SnackBarBehavior.floating,
      content: Text(msg, style: kNormal2BlackTextStyle().apply(color: kWhiteColor)),
    ));
  }

  static void showSnack(String msg) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      content: Text(
        msg,
        style: kMedium1BlackTextStyle(color: kWhiteColor),
      ),
      backgroundColor: kBlackColor,
    ));
  }

  static void showStaticNoInternetSnack() {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      content: Text(
        "No Internet Connection",
        style: kMedium1BlackTextStyle(),
      ),
      /*action: SnackBarAction(
        label: 'dismiss',
        textColor: kWhiteColor,
        onPressed: () {
          ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
        },
      ),*/
      backgroundColor: Colors.blue.shade900,
      duration: const Duration(seconds: 3),
    ));
  }

  static void showSnackBar(String msg, {Color? color}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      elevation: 6.0,
      backgroundColor: color ?? kBlackColor,
      content: Text(
        msg,
        style: kMedium1BlackTextStyle().apply(color: kWhiteColor),
      ),
    ));
  }

  static void showPermissionSnack(String msg) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
        content: Text(
          msg,
          style: kMedium1BlackTextStyle(),
        ),
        backgroundColor: Colors.orange.shade400));
  }

  // static void showToast(var s, {bool isLong = false}) {

  // }

  static void showToast(var s) {
    // EasyLoading.showToast(s);

    Fluttertoast.showToast(
        msg: s, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1);
  }

  static void showToastBottom(var s, {bool isLong = false}) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: kBlackColor,
        textColor: kWhiteColor,
        fontSize: 16.0);
  }
}
