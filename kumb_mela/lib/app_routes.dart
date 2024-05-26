import 'package:flutter/cupertino.dart';
import 'package:kumb_mela/screens/home_page.dart';
import 'package:kumb_mela/screens/profile_page.dart';

class AppRoutes {
  static const dashBoardRoute = '/DASHBOARD_PAGE';
  static const loginPageRoute = '/LOGIN_PAGE';
  static const caseViewRoute = '/CASE_VIEW_PAGE';
  static const profileRoute = '/PROFILE_PAGE';
  static const homeRoute = '/HOME_PAGE';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // dashBoardRoute: (ctx) => const HomeScreen(),
      profileRoute: (ctx) => const HomePage(),
      // homeRoute: (ctx) => const HomePage(),
      // caseViewRoute: (ctx) => const CaseViewPage(),
      // loginPageRoute: (ctx) => const LoginScreen(),
    };
  }
}
