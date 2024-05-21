// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import '../../utility/size_config.dart';
import '../Utility/constant.dart';
import '../app_routes.dart';
import '../theme/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // PushNotificationsManager.registerNotification();

    // PushNotificationsManager.registerNotification().then((value) {
    //   FlutterError.onError = (errorDetails) {
    //     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    //   };
    //   // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    //   PlatformDispatcher.instance.onError = (error, stack) {
    //     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    //     return true;
    //   };
    // });

    init();
    super.initState();
  }

  Future<void> init() async {
    // WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    //initialize storage provider
    // String packageName = await Customization.getPackageName();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<StorageProvider>(context, listen: false).setPackageName(packageName);
    // });
  }

  Future<void> _setNavigation() async {
    var userId = "";
    String route;
    if (userId.isEmpty) {
      route = AppRoutes.profileRoute;
    } else if (userId.isNotEmpty) {
      route = AppRoutes.profileRoute;
    }
    /* else if (adminId.isNotEmpty) {
      route = AppRoutes.adminDashBoardRoute;
    } */
    else {
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
                  Stream<double>.periodic(const Duration(milliseconds: 1500), (x) => MediaQuery.of(context).size.width),
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
