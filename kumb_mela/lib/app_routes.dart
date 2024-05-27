import 'package:flutter/cupertino.dart';
import 'package:kumb_mela/screens/dashboard_screens/home_page.dart';
import 'package:kumb_mela/screens/login_screens/forget_password.dart';
import 'package:kumb_mela/screens/login_screens/login_page.dart';
import 'package:kumb_mela/screens/login_screens/otp_screen.dart';
import 'package:kumb_mela/screens/login_screens/registration_complete.dart';

class AppRoutes {
  static const dashBoardRoute = '/DASHBOARD_PAGE';
  static const loginPageRoute = '/LOGIN_PAGE';
  static const registerPageRoute = '/REGISTER_PAGE';
  static const caseViewRoute = '/CASE_VIEW_PAGE';
  static const profileRoute = '/PROFILE_PAGE';
  static const homeRoute = '/HOME_PAGE';
  static const otpRoute = '/OTP_PAGE';
  static const forgotPasswordRoute = '/FORGOT_PASSWORD_PAGE';
  static const forgotPasswordRouteOtp = '/FORGOT_PASSWORD_OTP_PAGE';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // dashBoardRoute: (ctx) => const HomeScreen(),
      registerPageRoute: (ctx) => const RegistrationComplete(),
      homeRoute: (ctx) => const HomePage(),
      forgotPasswordRoute: (ctx) => const Login(),
      forgotPasswordRouteOtp: (ctx) => const OtpScreen(),
      // caseViewRoute: (ctx) => const CaseViewPage(),
      // loginPageRoute: (ctx) => const LoginScreen(),
    };
  }
}
