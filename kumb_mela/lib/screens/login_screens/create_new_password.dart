import 'package:flutter/material.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/custom_button/custom_button.dart';
import 'package:kumb_mela/other_pages/splash_screen.dart';
import 'package:kumb_mela/screens/dashboard_screens/dashboard.dart';
import 'package:kumb_mela/screens/login_screens/password_changed.dart';
import 'package:kumb_mela/theme/navigator.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/theme/text_style.dart';
import 'package:kumb_mela/utility/app_bar_widget.dart';
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
  bool _isCFPasswordVisible = true;
  bool _rememberMe = false;

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
                              Padding(
                                padding: kEdgeInsetsAll(3),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Create New Password",
                                      style: kMedium3BlackTextStyle().apply(color: kGreyColor, fontSizeDelta: 2)),
                                ),
                              ),
                              Padding(
                                padding: kEdgeInsetsAll(2),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Center(
                                    child: Text("This password should be different for this previous password",
                                        style: kMediumBlackTextStyle().apply(fontSizeDelta: 1, color: DescriptionGreyColor)),
                                  ),
                                ),
                              ),
                              kSizedBox(height: 2),
                              CustomTextField(
                                bgColor: kBlackColor,

                                keyboardType: TextInputType.visiblePassword,
                                suffixIcon: _widgetVisiblePassword(),
                                obscureText: _isPasswordVisible,
                                controller: _passwordController,
                                // labelText: "Password",
                                isMandatory: true,
                                hintText: 'Enter Password',
                              ),
                              kSizedBox(height: 4),
                              CustomTextField(
                                bgColor: kBlackColor,
                                keyboardType: TextInputType.visiblePassword,
                                suffixIcon: _widgetCfVisiblePassword(),
                                obscureText: _isCFPasswordVisible,
                                controller: _confirmpasswordController,
                                // labelText: "Password",
                                isMandatory: true,
                                hintText: 'Confirm Password',
                              ),
                              kSizedBox(height: 4),
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
                                    // SwitchController().isSwitched;

                                    // kNavigator(context, const DashBoardPage());
                                    // if (_formGlobalKey.currentState!.validate()) {
                                    //   ConfirmPassword();
                                    // }
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
                   ),
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

  Widget _widgetCfVisiblePassword() {
    return IconButton(
      icon: Icon(
        _isCFPasswordVisible ? Icons.visibility : Icons.visibility_off,
        color: kWhiteColor,
      ),
      onPressed: () => setState(() => _isCFPasswordVisible = !_isCFPasswordVisible),
    );
  }

  void ConfirmPassword() async {
    var model = {"username": _confirmpasswordController.text, "password": _passwordController.text};
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
              checkColor: Colors.blue, // The color of the check icon when the checkbox is checked
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
                child: Text("At least 8 characters", style: kMediumBlackTextStyle().apply(color: DescriptionGreyColor)),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("", style: kMediumBlackTextStyle().apply(color: DescriptionGreyColor)),
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
              checkColor: Colors.blue, // The color of the check icon when the checkbox is checked
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
                child: Text("At least 1 number", style: kMediumBlackTextStyle().apply(color: DescriptionGreyColor)),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("", style: kMediumBlackTextStyle().apply(color: DescriptionGreyColor)),
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
              checkColor: Colors.blue, // The color of the check icon when the checkbox is checked
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
                child:
                    Text("Both upper and lower case letter", style: kMediumBlackTextStyle().apply(color: DescriptionGreyColor)),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("", style: kMediumBlackTextStyle().apply(color: DescriptionGreyColor)),
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
