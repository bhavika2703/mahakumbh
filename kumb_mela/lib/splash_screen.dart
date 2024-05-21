import 'package:flutter/material.dart';
import 'package:kumb_mela/utils/size_config.dart';

import '../theme/navigator.dart';
import 'app_routes.dart';
import 'constatns.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _setNavigation() async {
    String userId = "12" /*await UserPreferences.getStudentId()*/;

    String route;
    if (userId.isNotEmpty) {
      route = AppRoutes.profileRoute;
    } else if (userId.isNotEmpty) {
      route = AppRoutes.profileRoute;

      // route = AppRoutes.adminDashBoardRoute;
    } else {
      route = AppRoutes.profileRoute;
    }
    navigatePage(route);
  }

  void navigatePage(var route) {
    kNavigatorPushNamedRemoveUntil(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Image.asset(Assets.icSplash),
              ),
            ),
            FutureBuilder<double>(
                future: whenNotZero(
                  Stream<double>.periodic(const Duration(milliseconds: 2500), (x) => MediaQuery.of(context).size.width),
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data! > 0) {
                      SizeConfig().init(context);

                      _setNavigation();
                    }
                  }
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Center(child: CircularProgressIndicator()),
                  );
                })
          ],
        ),
      ),
    );
  }

  Future<double> whenNotZero(Stream<double> source) async {
    await for (double value in source) {
      if (value > 0) {
        return value;
      }
    }
    return 0;
  }
}
