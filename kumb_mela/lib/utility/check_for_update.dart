// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:in_app_update/in_app_update.dart';
//
// Future<void> checkForInAppUpdate() async {
//   if (kReleaseMode) {
//     if (Platform.isAndroid) {
//       InAppUpdate.checkForUpdate().then((info) async {
//         if (info.updateAvailability == UpdateAvailability.updateAvailable) {
//           InAppUpdate.performImmediateUpdate().then((value) {
//             return checkForInAppUpdate();
//           }).catchError((e) {});
//         }
//       }).catchError((e) {});
//     }
//   }
// }
