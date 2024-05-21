// ignore_for_file: use_build_context_synchronously

 import 'package:flutter/material.dart';
import 'package:kumb_mela/utility/show_msg_snack.dart';
import 'package:permission_handler/permission_handler.dart';

import '../theme/text_style.dart';

class HandlePermission {
  final BuildContext context;

  HandlePermission(this.context);

  Future<bool> checkPermission() async {
    var status = await Permission.phone.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      await Permission.phone.request();
      final result = await HandlePermission(context).showPermissionDialog();
      return result == true;
    } else if (status.isPermanentlyDenied) {
      HandlePermission(context).showOpenSettingPermissionDialog();
      return false;
    }
    return false;
  }

  Future<bool>? showPermissionDialog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text(
                "Call Logs Permission",
                style: kBold2BlackTextStyle(),
              ),
              content: const Text("Permission was denied, but it needed for core functionality"),
              actions: [
                TextButton(
                    onPressed: () async {
                      Permission.phone.request().then((value) async {
                        if (await Permission.phone.isGranted) {
                          Navigator.pop(context, true);
                        } else if (await Permission.phone.isDenied) {
                          Navigator.pop(context, false);
                          showOpenSettingPermissionDialog();
                        } else if (await Permission.phone.isPermanentlyDenied) {
                          Navigator.pop(context, false);
                          showOpenSettingPermissionDialog();
                        }
                      });
                    },
                    child: const Text("OK"))
              ],
            ),
          );
        });
  }

  void showOpenSettingPermissionDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text(
                "Call Logs Permission",
                style: kBold2BlackTextStyle(),
              ),
              content: const Text(
                  "Permission was denied, but it needed for core functionality. Go to setting and allow call logs and Telephone permissions"),
              actions: [
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await openAppSettings();
                    ShowSnack.showToast("Please allow permission");
                  },
                  child: const Text("Open Setting"),
                )
              ],
            ),
          );
        });
  }
}
