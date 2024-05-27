import 'package:flutter/material.dart';

import '../theme/padding.dart';

const Color appBlue = Color(0xFF0054E5);

// Color kPrimaryColor = const Color(0xff106467);
// Color kPrimaryColor = const Color(0xff24695c);
Color kPrimaryColor = const Color(0xff0D41E1);
// Color kPrimaryColor2 = const Color(0xff60a89b);
Color kPrimaryColor3 = const Color(0xCCEBF8FF);
Color kPrimaryDarkColor = const Color(0xff17443c);
const kPrimaryColor1 = Color(0xFFE9F0F9);
const kgrey = Color(0xFF3A3A3A);
const kSecondaryColor = Color(0xffeef6f8);
const kPrimaryGradient3 = Color(0xffd6e7ff);
// const kPrimaryBGColor = Color(0xffD4E8FF);
const kPrimaryBGColor = Color(0xffEAF2FA);
const kPrimaryColor2 = Color(0xffD4E8FF);
const KGrey = Color(0xFF6C6C6C);
const kWhiteColor = Color(0xffffffff);
const kFedColor = Color(0xff91ABC7);
const kPageBgColor = Color(0xffffffff);
const kScreenBgColor = Color(0xffffffff);
const kContainerBgColor = Color(0xffffffff);
const kAppBarTextColor = Color(0xffffffff);
const kAppBarWhiteColor = Color(0xffffffff);
const kBlackColor = Color(0xff000000);
const kLightBlackColor = Color(0xff363636);
const kTextBlackColor = Color(0xff1d150b);
const kDrawerHeaderColor = Color(0xffe2e4f1);
const kHeaderColor = Color(0xfffdf8ff);
const kDeepPurple = Color(0xff5C33AC);
final kGreyColor4TransparentColor = kGreyColor3.withOpacity(0.1);
const kPrimaryGradient1 = Color(0xffe9f0f9);

const kWarningColor = Color(0xffcc3300);

const kSecondaryDarkColor = Color(0xff201d49);
const kBlueColor = Color(0xff3F51B5);
const kCardBgColor = Color(0xff4d4a6d);
const kHeaderBgColor = Color(0xffd1d0d9);
const kOffWhiteColor = Color(0xfff5f4f6);
const kkTitleBoxColor = Color(0xffffffff);
const kButtonColor = Color(0xff1c2834);
const kSecondaryTextColor = Color(0xff004d40);

final kGreyColor = Colors.grey.shade50;
final kGreyColor1 = Colors.grey.shade100;
final kGreyColor2 = Colors.grey.shade200;
final kGreyColor3 = Colors.grey.shade300;
final kGreyColor4 = Colors.grey.shade400;
final kGreyColor5 = Colors.grey.shade500;
final kGreyColor6 = Colors.grey.shade600;
final kGreyColor7 = Colors.grey.shade700;
final kGreyColor8 = Colors.grey.shade800;
final kGreyColor9 = Colors.grey.shade900;

final kBlueGreyColor = Colors.blueGrey.shade50;
final kBlueGreyColor1 = Colors.blueGrey.shade100;
final kBlueGreyColor2 = Colors.blueGrey.shade200;
final kBlueGreyColor3 = Colors.blueGrey.shade300;
final kBlueGreyColor4 = Colors.blueGrey.shade400;
final kBlueGreyColor5 = Colors.blueGrey.shade500;
final kBlueGreyColor6 = Colors.blueGrey.shade600;
final kBlueGreyColor7 = Colors.blueGrey.shade700;
final kBlueGreyColor8 = Colors.blueGrey.shade800;

const kBlue = Colors.blue;
final kBlueColor6 = Colors.blue.shade600;
final kBlueColor7 = Colors.blue.shade700;
final kBlueColor8 = Colors.blue.shade800;
final kBlueColor9 = Colors.blue.shade900;

final kCyanColor6 = Colors.cyan.shade600;
final kCyanColor7 = Colors.cyan.shade700;
final kCyanColor9 = Colors.cyan.shade900;

final kBlueIndigoColor7 = Colors.indigo.shade700;

const kSkillCardBGColor = Color(0xff3a3591);
const kBlueBGLightColor = Color(0xfffcfcff);
const card1Color = Color(0xfff1f2ff);
const card2Color = Color(0xffe9f5ea);
const card3Color = Color(0xfff7ebe5);
const whiteTextColor = Color(0xffffffff);

const kPinkColor = Color(0xffc51162);
const kOrangeColor = Color(0xffff803b);
const kTabIndicatorColor = Color(0xffff803b);
final kOrangeColor8 = Colors.orange.shade800;
const kGreenColor = Color(0xff0a550a);
final kGreenColor9 = Colors.green.shade900;
final kGreenColor5 = Colors.green.shade500;
final kGreenColor7 = Colors.green.shade700;
final kGreenColor4 = Colors.green.shade400;
final kGreenColor1 = Colors.green.shade100;
const kRedColor = Color(0xffc23434);
const kRedColor2 = Color(0xffd94949);
final kRedColor6 = Colors.red.shade600;
final kRedColor7 = Colors.red.shade700;

const kAbsentColor = Color(0xffCF0303);
const kHalfDayColor = Color(0xffFC856E);
const kPresentColor = Color(0xff128c58);
final kBorderColor = kGreyColor4;

const kTransparentColor = Colors.transparent;

const kBridgwillSplashBgColor = Color(0xff151241);
const kBachpanJayalBgColor = Color(0xffb61617);
const kBachpanMarthaBgColor = Color(0xffffb3b3);
const DescriptionGreyColor = Color.fromRGBO(179, 179, 179, 1);

final kBoxShadow =
    BoxShadow(color: kGreyColor3, offset: const Offset(1, 3), blurRadius: 8);

final kBoxShadow2 = BoxShadow(
  color: kGreyColor6.withOpacity(0.3),
  offset: const Offset(0, 4),
  blurRadius: 5.0,
);

BoxDecoration kBoxDecoration({Color? color, double? radius, BoxShape? shape}) {
  return BoxDecoration(
    // shape: shape ?? BoxShape.rectangle,
    color: color ?? kWhiteColor,
    borderRadius: BorderRadius.circular(radius ?? 8),
    boxShadow: [kCardShadow],
  );
}

final kCardShadow = BoxShadow(
    color: Colors.grey.shade300, offset: const Offset(0, 3), blurRadius: 5);

Widget kBottomSheetHorizontalLine({color}) {
  return Container(
    margin: kEdgeInsetsSymmetricHV(v: 2),
    width: kSize(12),
    height: kSize(1),
    decoration: BoxDecoration(
        borderRadius: kBorderRadius(15), color: color ?? kGreyColor5),
  );
}

BoxDecoration kBottomSheetBgDecoration({color}) {
  return BoxDecoration(
    color: color ?? kSecondaryColor,
    borderRadius: kBorderRadiusOnly(topLeft: 20, topRight: 20),
  );
}
