import 'package:flutter/cupertino.dart';
import 'package:kumb_mela/screens/create_new_password.dart';
import 'package:kumb_mela/screens/forgot_password_otp.dart';
import 'package:kumb_mela/screens/forgot_password_screen.dart';
import 'package:kumb_mela/screens/home_page.dart';
import 'package:kumb_mela/screens/login_page.dart';
import 'package:kumb_mela/screens/otp_screen.dart';
import 'package:kumb_mela/screens/password_changed.dart';
import 'package:kumb_mela/screens/profile_page.dart';
import 'package:kumb_mela/screens/registration_complete.dart';
import 'package:kumb_mela/screens/registration_page.dart';

class AppRoutes {
  static const dashBoardRoute = '/DASHBOARD_PAGE';
  static const loginPageRoute = '/LOGIN_PAGE';
  static const RegisterPageRoute = '/REGISTER_PAGE';
  static const caseViewRoute = '/CASE_VIEW_PAGE';
  static const profileRoute = '/PROFILE_PAGE';
  static const homeRoute = '/HOME_PAGE';
  static const otpRoute = '/OTP_PAGE';
  static const forgotpasswordRoute = '/FORGOTPASSWORD_PAGE';
  static const forgotpasswordRouteOtp = '/FORGOTPASSWORDOTP_PAGE';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // dashBoardRoute: (ctx) => const HomeScreen(),
      profileRoute: (ctx) => RegistrationComplete(),
      // homeRoute: (ctx) => const HomePage(),
      // caseViewRoute: (ctx) => const CaseViewPage(),
      // loginPageRoute: (ctx) => const LoginScreen(),
    };
  }
}
