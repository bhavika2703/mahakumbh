import 'package:flutter/material.dart';

import '../colors/light_colors.dart';
import '../theme/padding.dart';

class Assets {
  static String assetImages = "assets/images/";

  static String assetDrawerIcons = "assets/drawer_icon/";

  // static String icSplash = '${assetLogo}logo.png';
  static String icSplash = '${assetImages}splash.jpg';
  static String icContact = '${assetImages}contact.png';
  static String icRegistration = '${assetDrawerIcons}ic_registration.jpg';
  static String icUserPlaceHolder = '${assetImages}ic_placeHolder.png';
  static String icColorDrawer = '${assetImages}color_drawer.png';
  static String icDrawerIcon = '${assetDrawerIcons}drawer_icon.png';
  static String icFile = '${assetDrawerIcons}drawer_icon.png';
  static String icAartiMessage = '${assetImages}ic_aarti_image.png';
}

class StringConstant {
  static String loginSuccess = 'Login Successfully...';
  static String noInternet = 'No Internet Connection...';
  static String noChildFound = 'No Child Found...';
  static String noDataAvailable = 'No Data Available...';
  static String failedToLoad = 'Failed to load data';
  static String fileNoFound = 'File not found';
  static String noImageUrl = 'https://erp.socialchowk.com/public//backend/images/no_image.png';
  static String somethingWent = 'Something went wrong...';
  static String tokenExpired = 'Token expired please login again...';

  //Default events
  static const String eventConnect = "connect";
  static const String eventDisconnect = "disconnect";
  static const String eventConnectTimeout = "connect_timeout";
  static const String onSocketError = "onSocketError";

  //Video Call  events
  static const String connectCall = "connectCall";
  static const String onCallRequest = "onCallRequest";
  static const String acceptCall = "acceptCall";
  static const String onAcceptCall = "onAcceptCall";
  static const String rejectCall = "rejectCall";
  static const String onRejectCall = "onRejectCall";
}

class ApiConstants {}

Widget kHorizontalDivider({double height = 10, Color? color, EdgeInsetsGeometry? margin}) {
  return Container(
    height: height,
    width: 1.0,
    color: color ?? kGreyColor4,
    margin: margin ?? kEdgeInsetsOnly(left: 2.0, right: 2.0),
  );
}
