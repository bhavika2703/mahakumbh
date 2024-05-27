import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/constatns.dart';
import 'package:kumb_mela/custom_button/custom_button.dart';
import 'package:kumb_mela/other_pages/splash_screen.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/theme/text_style.dart';
import 'package:kumb_mela/utility/size_config.dart';
import 'package:kumb_mela/utility/widgets/app_constant.dart';
import 'package:kumb_mela/utility/widgets/custom_fields/custom_text_field.dart';

class ForgotPasswordOtp extends StatefulWidget {
  const ForgotPasswordOtp({super.key});

  @override
  State<ForgotPasswordOtp> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordOtp> {
  final _nameController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();
  bool _isProgress = false;
  bool _isPasswordVisible = true;
  bool _rememberMe = false;

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
                              height: MediaQuery.of(context).size.height / 8,
                            ),
                            // CircleAvatar(
                            //   backgroundImage: AssetImage(Assets.icForgotPasswordImage),
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
                            Padding(
                              padding: kEdgeInsetsAll(3),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Please check your email",
                                    style: kMediumBlackTextStyle().apply(
                                        fontSizeDelta: 10,
                                        color: kBlueGreyColor4)),
                              ),
                            ),
                            Padding(
                              padding: kEdgeInsetsAll(2),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "We have send the code to Econn@gmail.com",
                                    style: kMediumBlackTextStyle().apply(
                                        fontSizeDelta: 1,
                                        color: DescriptionGreyColor)),
                              ),
                            ),
                            kSizedBox(height: 10),

                            OtpTextField(
                              numberOfFields: 5,
                              borderColor: Color(0xFF512DA8),
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Verification Code"),
                                        content: Text(
                                            'Code entered is $verificationCode'),
                                      );
                                    });
                              }, // end onSubmit
                            ),
                            kSizedBox(height: 5),
                            Padding(
                              padding: kEdgeInsetsAll(2),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Center(
                                  child: Text("Send code again -  00:34",
                                      style: kMediumBlackTextStyle().apply(
                                          fontSizeDelta: 1,
                                          color: DescriptionGreyColor)),
                                ),
                              ),
                            ),
                            kSizedBox(height: 8),
                            CustomButton(
                                title: AppConstant.forgotButtonOtpText,
                                onPressed: () {
                                  if (_formGlobalKey.currentState!.validate()) {
                                    ForgotPassword();
                                  }
                                }),
                            kSizedBox(height: 3),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // CustomButton(
                //     title: AppConstant.ForgotPasswordButtonText,
                //     onPressed: () {
                //       if (_formGlobalKey.currentState!.validate()) {
                //         ForgotPassword();
                //       }
                //     }),
              ],
            ),
            if (_isProgress) const SplashScreen()
          ],
        ));
  }

  Widget _widgetVisiblePassword() {
    return IconButton(
      icon: Icon(
        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        color: kWhiteColor,
      ),
      onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
    );
  }

  void ForgotPassword() async {
    var model = {
      "username": _nameController.text,
    };
    setProgress(true);
    // try {
    //   final response = await KhumabMelaApis.ForgotPassword(model);
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
