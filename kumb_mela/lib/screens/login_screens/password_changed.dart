import 'package:flutter/material.dart';
import 'package:kumb_mela/colors/light_colors.dart';
 import 'package:kumb_mela/custom_button/custom_button.dart';
import 'package:kumb_mela/theme/navigator.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/theme/text_style.dart';
import 'package:kumb_mela/utility/size_config.dart';
import 'package:kumb_mela/utility/widgets/app_constant.dart';

import '../../Utility/constant.dart';
import '../../utility/app_bar_widget.dart';
import '../dashboard_screens/home_page.dart';

class PasswordChanged extends StatefulWidget {
  const PasswordChanged({super.key});

  @override
  State<PasswordChanged> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<PasswordChanged> {
  final _formGlobalKey = GlobalKey<FormState>();
  bool _isProgress = false;
  bool _isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: appBarWhite(title: "", backgroundColor: kBlackColor),
        body: Container(
          decoration: kGradientBoxDecoration(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: kEdgeInsetsAll(2),
                        child: Form(
                          key: _formGlobalKey,
                          child: Column(
                            children: [
                              kSizedBox(height: 5),
                              Padding(
                                padding: kEdgeInsetsAll(2),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Center(
                                    child: Image.asset(
                                      Assets.animation,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: kEdgeInsetsAll(3),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Center(
                                    child: Text("Password changed", style: kMedium1BlackTextStyle().apply(color: kGreyColor10)),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Center(
                                  child: Text("Your password is reset successfully",
                                      style: kMedium2BlackTextStyle().apply(color: DescriptionGreyColor)),
                                ),
                              ),
                              kSizedBox(height: 5),
                              CustomButton(
                                  title: AppConstant.PasswordChangedButtonText,
                                  onPressed: () {
                                    kNavigator(context, const HomePage());
                                  }),
                              kSizedBox(height: 3),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void login() async {
    var model = {
      // "username": _nameController.text,
      // "password": _passwordController.text
    };
    setProgress(true);
    // try {
    //   final response = await KhumabMelaApis.login(model);
    //   setProgress(false);
    //   if (response.statusCode == 200) {
    //     var map = jsonDecode(response.body);
    //     kPrint(map);
    //     if (map['status'] != 0) {
    //       // if (mounted) {
    //       await PreferenceService.setFcmToken(map['token'] ?? "");
    //       kNavigatorPushNamedRemoveUntil(
    //           context, AppRoutes.uploadInformationRoute);
    //       // }
    //     } else {
    //       ShowSnack.showErrorSnack("Invalid Username and Password..");
    //       // Navigator.pop(context);
    //     }
    //   } else {
    //     ShowSnack.showErrorSnack("Invalid Username and Password..");
    //   }
    // } catch (e) {
    //   ShowSnack.showErrorSnack('Something went wrong $e');
    // setProgress(false);
    // Navigator.pop(context);
    // throw Exception(e);
  }

  void setProgress(bool b) => setState(() => _isProgress = b);

// Padding buildHeadingView({required String title}) {
//   return Padding(
//     padding: kEdgeInsetsSymmetricHV(h: 2, v: 1),
//     child: Text(title,
//         style: kBold1BlackTextStyle().apply(
//           fontSizeDelta: 1,
//         )),
//   );
// }
}
