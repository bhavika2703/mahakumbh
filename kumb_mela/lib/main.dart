import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:kumb_mela/theme/theme_controller.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app_routes.dart';
import 'data_services/my_http_overrides.dart';
import 'other_pages/splash_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final themeController = Get.put(ThemeController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maha Kumbh 2025',
        theme: themeController.isDarkMode.value ? DarkTheme.dark : LightTheme.light,
        // theme: ThemeData(
        //   primaryColor: kPrimaryColor,
        //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //     elevation: 0,
        //     foregroundColor: Colors.white,
        //   ),
        //   colorScheme: ColorScheme.fromSwatch().copyWith(
        //     primary: kPrimaryColor,
        //     secondary: kPrimaryColor2,
        //     background: kWhiteColor,
        //   ),
        //   primarySwatch: Colors.deepPurple,
        //   scaffoldBackgroundColor: Colors.grey.shade50,
        //   splashColor: Colors.grey,
        //   visualDensity: VisualDensity.adaptivePlatformDensity,
        //   textTheme: kDefaultTextTheme,
        //   appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
        //   dialogBackgroundColor: kWhiteColor,
        //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: kWhiteColor),
        //   dividerTheme: const DividerThemeData(color: Colors.black12),
        // ),
        navigatorKey: navigatorKey,
        home: const SplashScreen(),
        // builder: EasyLoading.init(),-
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
