// In a separate file (e.g., theme_controller.dart)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kumb_mela/colors/light_colors.dart';

class ThemeController extends GetxController {
  final RxBool isDarkMode = RxBool(false); // Initially set to light mode

  @override
  void onReady() {
    toggleTheme();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? DarkTheme.dark : LightTheme.light);
    update();
  }
}

class LightTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryOrangeColor,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(),
  );
}
// ThemeData(
// primaryColor: kPrimaryColor,
// floatingActionButtonTheme: const FloatingActionButtonThemeData(
// elevation: 0,
// foregroundColor: Colors.white,
// ),
// colorScheme: ColorScheme.fromSwatch().copyWith(
// primary: kPrimaryColor,
// secondary: kPrimaryColor2,
// background: kWhiteColor,
// ),
// primarySwatch: Colors.deepPurple,
// scaffoldBackgroundColor: Colors.grey.shade50,
// splashColor: Colors.grey,
// visualDensity: VisualDensity.adaptivePlatformDensity,
// textTheme: kDefaultTextTheme,
// appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
// dialogBackgroundColor: kWhiteColor,
// bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: kWhiteColor),
// dividerTheme: const DividerThemeData(color: Colors.black12),
// ),

class DarkTheme {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(),
  );
}
