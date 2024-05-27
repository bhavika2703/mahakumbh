import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/constatns.dart';
import 'package:kumb_mela/custom_button/custom_button.dart';
import 'package:kumb_mela/other_pages/splash_screen.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/theme/text_style.dart';
import 'package:kumb_mela/utility/size_config.dart';
import 'package:kumb_mela/utility/widgets/app_constant.dart';
import 'package:kumb_mela/utility/widgets/custom_fields/custom_text_field.dart';

class RegistrationComplete extends StatefulWidget {
  const RegistrationComplete({super.key});

  @override
  State<RegistrationComplete> createState() => _RegistrationCompleteState();
}

class _RegistrationCompleteState extends State<RegistrationComplete> {
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
        backgroundColor: kBlackColor,
        body: Stack(
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 9,
                            ),
                            // CircleAvatar(
                            //   backgroundImage: AssetImage(Assets.icLoginImage),
                            //   radius: 70.0,
                            // ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                color: Colors.grey,
                                onPressed: () {
                                  Navigator.pop(
                                      context); // Navigate back to the previous screen
                                },
                              ),
                            ),
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
                                  child: Text("Welcome Aboard!",
                                      style: kMediumBlackTextStyle().apply(
                                          fontSizeDelta: 10,
                                          color: kBlueGreyColor4)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: kEdgeInsetsAll(2),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Center(
                                  child: Text(
                                      "You've successfully verified your Email ID. ",
                                      style: kMediumBlackTextStyle().apply(
                                          fontSizeDelta: 1,
                                          color: DescriptionGreyColor)),
                                ),
                              ),
                            ),
                            kSizedBox(height: 2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // CustomButton(
                //     title: AppConstant.loginButtonText,
                //     onPressed: () {
                //       if (_formGlobalKey.currentState!.validate()) {
                //         login();
                //       }
                //     }),
              ],
            ),
            if (_isProgress) const SplashScreen()
          ],
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
