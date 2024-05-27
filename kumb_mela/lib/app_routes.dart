import 'package:flutter/cupertino.dart';
import 'package:kumb_mela/screens/login_screens/forget_password.dart';
import 'package:kumb_mela/screens/login_screens/otp_screen.dart';
import 'package:kumb_mela/screens/profile_page.dart';


class AppRoutes {
  static const dashBoardRoute = '/DASHBOARD_PAGE';
  static const loginPageRoute = '/LOGIN_PAGE';
  static const caseViewRoute = '/CASE_VIEW_PAGE';
  static const profileRoute = '/PROFILE_PAGE';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // dashBoardRoute: (ctx) => const HomeScreen(),
      profileRoute: (ctx) => const ProfilePage(),
      // caseViewRoute: (ctx) => const CaseViewPage(),
      // loginPageRoute: (ctx) => const LoginScreen(),
    };
  }
}
