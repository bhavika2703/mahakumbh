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

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  final _confirmpasswordController = TextEditingController();
  final _passwordController = TextEditingController();
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
                            //   backgroundImage: AssetImage(Assets.icConfirmPasswordImage),
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
                                child: Text("Create New Password",
                                    style: kMediumBlackTextStyle().apply(
                                        fontSizeDelta: 10,
                                        color: kBlueGreyColor4)),
                              ),
                            ),
                            Padding(
                              padding: kEdgeInsetsAll(2),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Center(
                                  child: Text(
                                      "This password should be different for this previous password",
                                      style: kMediumBlackTextStyle().apply(
                                          fontSizeDelta: 1,
                                          color: DescriptionGreyColor)),
                                ),
                              ),
                            ),
                            kSizedBox(height: 2),

                            CustomTextField(
                                bgColor: kBlackColor,
                                controller: _confirmpasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.person_3_rounded),
                                  onPressed: () {},
                                ),
                                // labelText: "UserName",
                                isMandatory: true,
                                hintText: "Enter new password"),
                            kSizedBox(height: 5),
                            CustomTextField(
                              bgColor: kBlackColor,
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.lock_outline_rounded),
                                onPressed: () {},
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              // suffixIcon: _widgetVisiblePassword(),
                              obscureText: _isPasswordVisible,
                              controller: _passwordController,
                              // labelText: "Password",
                              isMandatory: true,
                              hintText: ' Confirm new password',
                            ),
                            kSizedBox(height: 2),
                            Column(
                              children: [
                                _buildRememberMeRow(context),
                                tick2(context),
                                tick3(context),
                              ],
                            ),
                            kSizedBox(height: 5),
                            CustomButton(
                                title: AppConstant.ConfirmPasswordButtonText,
                                onPressed: () {
                                  if (_formGlobalKey.currentState!.validate()) {
                                    ConfirmPassword();
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
                //     title: AppConstant.ConfirmPasswordButtonText,
                //     onPressed: () {
                //       if (_formGlobalKey.currentState!.validate()) {
                //         ConfirmPassword();
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

  void ConfirmPassword() async {
    var model = {
      "username": _confirmpasswordController.text,
      "password": _passwordController.text
    };
    setProgress(true);
    // try {
    //   final response = await KhumabMelaApis.ConfirmPassword(model);
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

  Widget _buildRememberMeRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Checkbox(
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.white; // Color when checkbox is checked
                }
                return Colors.white; // Color when checkbox is unchecked
              }),
              checkColor: Colors
                  .blue, // The color of the check icon when the checkbox is checked
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Padding(
            padding: kEdgeInsetsAll(1),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("At least 8 characters",
                    style: kMediumBlackTextStyle()
                        .apply(color: DescriptionGreyColor)),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("",
                    style: kMediumBlackTextStyle()
                        .apply(color: DescriptionGreyColor)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tick2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Checkbox(
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.white; // Color when checkbox is checked
                }
                return Colors.white; // Color when checkbox is unchecked
              }),
              checkColor: Colors
                  .blue, // The color of the check icon when the checkbox is checked
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Padding(
            padding: kEdgeInsetsAll(1),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("At least 1 number",
                    style: kMediumBlackTextStyle()
                        .apply(color: DescriptionGreyColor)),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("",
                    style: kMediumBlackTextStyle()
                        .apply(color: DescriptionGreyColor)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget tick3(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Checkbox(
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.white; // Color when checkbox is checked
                }
                return Colors.white; // Color when checkbox is unchecked
              }),
              checkColor: Colors
                  .blue, // The color of the check icon when the checkbox is checked
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Padding(
            padding: kEdgeInsetsAll(1),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("Both upper and lower case letter",
                    style: kMediumBlackTextStyle()
                        .apply(color: DescriptionGreyColor)),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("",
                    style: kMediumBlackTextStyle()
                        .apply(color: DescriptionGreyColor)),
              ),
            ),
          ),
        ],
      ),
    );
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
