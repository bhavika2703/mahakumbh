import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/light_colors.dart';
import '../utility/size_config.dart';

final kMontserratTextTheme = GoogleFonts.montserratTextTheme();
const kGoogleFontMontserrat = GoogleFonts.inter;

var kDefaultTextTheme = kMontserratTextTheme;
var kDefaultTextStyle = kGoogleFontMontserrat;

TextStyle kNormal0BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
    color: color ?? kTextBlackColor,
    fontSize: SizeConfig.body0FontSize,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kNormalBlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
    color: color ?? kTextBlackColor,
    fontSize: SizeConfig.bodyFontSize,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kNormal1BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
    color: color ?? kTextBlackColor,
    fontSize: SizeConfig.body1FontSize,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kNormal2BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
    color: color ?? kTextBlackColor,
    fontSize: SizeConfig.body2FontSize,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kNormal3BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
    color: color ?? kTextBlackColor,
    fontSize: SizeConfig.body3FontSize,
    fontWeight: FontWeight.w400,
  );
}

TextStyle kMedium0BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w500, color: color ?? kTextBlackColor, fontSize: SizeConfig.body0FontSize);
}

TextStyle kMediumBlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w500, color: color ?? kTextBlackColor, fontSize: SizeConfig.bodyFontSize);
}

TextStyle kMedium1BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w500, color: color ?? kTextBlackColor, fontSize: SizeConfig.body1FontSize);
}

TextStyle kMedium2BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w500, color: color ?? kTextBlackColor, fontSize: SizeConfig.body2FontSize);
}

TextStyle kMedium3BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w500, color: color ?? kTextBlackColor, fontSize: SizeConfig.body3FontSize);
}

TextStyle kSemiBold0BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w600, color: color ?? kTextBlackColor, fontSize: SizeConfig.body0FontSize);
}

TextStyle kSemiBoldBlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w600, color: color ?? kTextBlackColor, fontSize: SizeConfig.bodyFontSize);
}

TextStyle kSemiBold1BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w600, color: color ?? kTextBlackColor, fontSize: SizeConfig.body1FontSize);
}

TextStyle kSemiBold2BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w600, color: color ?? kTextBlackColor, fontSize: SizeConfig.body2FontSize);
}

TextStyle kSemiBold3BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w600, color: color ?? kTextBlackColor, fontSize: SizeConfig.body3FontSize);
}

TextStyle kSemiBold4BlackTextStyle({Color color = kTextBlackColor}) {
  return kDefaultTextStyle(fontWeight: FontWeight.w600, color: color, fontSize: SizeConfig.body4FontSize);
}

TextStyle kBold0BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w700, color: color ?? kTextBlackColor, fontSize: SizeConfig.body0FontSize);
}

TextStyle kBoldBlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w700, color: color ?? kTextBlackColor, fontSize: SizeConfig.bodyFontSize);
}

TextStyle kBold1BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w700, color: color ?? kTextBlackColor, fontSize: SizeConfig.body1FontSize);
}

TextStyle kBold2BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w700, color: color ?? kTextBlackColor, fontSize: SizeConfig.body2FontSize);
}

TextStyle kBold3BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w700, color: color ?? kTextBlackColor, fontSize: SizeConfig.body3FontSize);
}

TextStyle kBold4BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w700, color: color ?? kTextBlackColor, fontSize: SizeConfig.body4FontSize);
}

TextStyle kExtra1BoldBlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w800, color: color ?? kTextBlackColor, fontSize: SizeConfig.body1FontSize);
}

TextStyle kExtraBold3BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w800, color: color ?? kTextBlackColor, fontSize: SizeConfig.body3FontSize);
}

TextStyle kExtraBold4BlackTextStyle({Color? color}) {
  return kDefaultTextStyle(
      fontWeight: FontWeight.w800, color: color ?? kTextBlackColor, fontSize: SizeConfig.body4FontSize);
}

Color getComfortableTextColor(Color color) {
  return color.computeLuminance() > 0.5 ? kBlackColor : kWhiteColor;
}
