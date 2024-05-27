
import 'package:flutter/material.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/theme/text_style.dart';

import '../colors/light_colors.dart';

ThemeData loginTextFieldTheme() {
  BorderRadius borderRadius = BorderRadius.circular(8.0);
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: kSecondaryColor,
    textTheme: kDefaultTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kSecondaryColor, width: 1.5), borderRadius: borderRadius),
      contentPadding: kEdgeInsetsSymmetricHV(h: 4),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kSecondaryColor, width: 2), borderRadius: borderRadius),
      border: OutlineInputBorder(borderRadius: borderRadius, borderSide: const BorderSide(width: 1.5)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius, borderSide: const BorderSide(color: kWarningColor, width: 1.5)),
      errorBorder:
          OutlineInputBorder(borderRadius: borderRadius, borderSide: const BorderSide(color: kWarningColor)),
      errorStyle: const TextStyle(color: kRedColor),
      hintStyle:const TextStyle(color: kSecondaryColor) ,
      disabledBorder: OutlineInputBorder(borderRadius: borderRadius, borderSide: const BorderSide(width: 1.5)),
    ),
  );
}

ThemeData textFieldTheme({double radius = 8.0}) {
  BorderRadius borderRadius = BorderRadius.circular(radius);
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: kSecondaryColor,
    textTheme: kDefaultTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: kGreyColor7),
      hintStyle: TextStyle(color: kGreyColor7),
      fillColor: kWhiteColor,
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor, width: 1.5), borderRadius: borderRadius),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kSecondaryColor, width: 2), borderRadius: borderRadius),
      border:
          OutlineInputBorder(borderRadius: borderRadius, borderSide: BorderSide(width: 1.5, color: kGreyColor5)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius, borderSide: const BorderSide(color: kWarningColor, width: 1.5)),
      errorBorder:
          OutlineInputBorder(borderRadius: borderRadius, borderSide: const BorderSide(color: kWarningColor)),
      errorStyle: const TextStyle(color: kRedColor),
      disabledBorder:
          OutlineInputBorder(borderRadius: borderRadius, borderSide: BorderSide(width: 1.5, color: kGreyColor4)),
    ),
  );
}

ThemeData dropDownThemeData({double? radius}) {
  BorderRadius borderRadius = BorderRadius.circular(radius ?? 35);
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: kSecondaryColor,
    textTheme: kDefaultTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.grey.shade600),
      hintStyle: TextStyle(color: Colors.grey.shade500),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5), borderRadius: borderRadius),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor, width: 2.0), borderRadius: borderRadius),
      filled: true,
      fillColor: kWhiteColor,
      border: OutlineInputBorder(borderRadius: borderRadius, borderSide: const BorderSide(width: 1.5)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius, borderSide: const BorderSide(width: 2.0, color: kWarningColor)),
      errorBorder:
          OutlineInputBorder(borderRadius: borderRadius, borderSide: const BorderSide(color: kWarningColor)),
      disabledBorder: OutlineInputBorder(borderRadius: borderRadius, borderSide: const BorderSide(width: 1.5)),
    ),
  );
}

ThemeData dateDropDownTheme({double? radius}) {
  // BorderRadius borderRadius = BorderRadius.circular(radius ?? 6.0);
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: kSecondaryColor,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.grey.shade600),
      hintStyle: TextStyle(color: Colors.grey.shade500),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      filled: true,
      isDense: true,
      fillColor: kTransparentColor,
    ),
  );
}

ThemeData textFieldThemeData({double? radius, Color? bgColor, BorderSide? enableBorderSide}) {
  BorderRadius borderRadius = BorderRadius.circular(radius ?? 25.0);
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: kPrimaryColor,
    textTheme: kDefaultTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: kGreyColor6),
      hintStyle: TextStyle(color: kGreyColor6),
      filled: true,
      fillColor: bgColor ?? kWhiteColor,
      enabledBorder: OutlineInputBorder(
          borderSide: enableBorderSide ?? BorderSide(color: kGreyColor7, width: 1.5), borderRadius: borderRadius),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: kPrimaryColor, width: 2.0), borderRadius: borderRadius),
      border: OutlineInputBorder(borderRadius: borderRadius, borderSide: const BorderSide(width: 1.5)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius, borderSide: const BorderSide(width: 2.0, color: kWarningColor)),
      errorBorder:
          OutlineInputBorder(borderRadius: borderRadius, borderSide: const BorderSide(color: kWarningColor)),
      disabledBorder: OutlineInputBorder(
          borderRadius: borderRadius, borderSide: BorderSide(width: 1.5, color: Colors.grey.shade600)),
    ),
  );
}

ThemeData dropDownThemeData2({double? radius}) {
  return ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: kSecondaryColor,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.grey.shade600),
      hintStyle: TextStyle(color: Colors.grey.shade500),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      filled: true,
      isDense: true,
      fillColor: kTransparentColor,
    ),
  );
}
