import 'package:flutter/material.dart';
import 'package:kumb_mela/colors/extenstion.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/custom_button/custom_button.dart';
import 'package:kumb_mela/other_pages/splash_screen.dart';
import 'package:kumb_mela/screens/login_screens/forget_password.dart';
import 'package:kumb_mela/screens/login_screens/registration_page.dart';
import 'package:kumb_mela/theme/navigator.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/theme/text_style.dart';
import 'package:kumb_mela/utility/size_config.dart';
import 'package:kumb_mela/utility/widgets/app_constant.dart';
import 'package:kumb_mela/utility/widgets/custom_fields/custom_text_field.dart';

import '../../Utility/constant.dart';
import '../dashboard_screens/home_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _nameController = TextEditingController();
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
        body: Container(
      decoration: kGradientBoxDecoration(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Column(
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
                                    Assets.logo,
                                    height: kSize(25),
                                    width: kSize(25),
                                  ),
                                ),
                              ),
                            ),
                            kSizedBox(height: 2),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Center(
                                child:
                                    Text("Hey,Hello", style: kBold2BlackTextStyle().apply(fontSizeDelta: 5, color: kWhiteColor)),
                              ),
                            ),
                            Padding(
                              padding: kEdgeInsetsAll(2),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Center(
                                  child: Text("Before you begin, let's ensure it's you.",
                                      style: kMediumBlackTextStyle().apply(fontSizeDelta: 1, color: DescriptionGreyColor)),
                                ),
                              ),
                            ),
                            kSizedBox(height: 2),
                            CustomTextField(
                                bgColor: kBlackColor,
                                controller: _nameController,
                                suffixIcon: IconButton(
                                  icon: Image.asset(Assets.icContact, color: kGreyColor10, height: kSize(6), width: kSize(6)),
                                  onPressed: () {},
                                ),
                                // labelText: "UserName",
                                isMandatory: true,
                                hintText: "Mobile Number /Email"),
                            kSizedBox(height: 5),
                            CustomTextField(
                              bgColor: kBlackColor,
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: kGreyColor10,
                                ),
                                onPressed: () {},
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              // suffixIcon: _widgetVisiblePassword(),
                              obscureText: _isPasswordVisible,
                              controller: _passwordController,
                              // labelText: "Password",
                              isMandatory: true,
                              hintText: ' Password',
                            ),
                            kSizedBox(height: 2),
                            _buildRememberMeRow(context),
                            kSizedBox(height: 5),
                            CustomButton(
                                title: AppConstant.loginButtonText,
                                onPressed: () {
                                  if (_formGlobalKey.currentState!.validate()) {
                                    kNavigator(context, const HomePage());
                                  }
                                }),
                            kSizedBox(height: 3),
                            Text(
                              "Or",
                              style: kMediumBlackTextStyle().apply(color: DescriptionGreyColor),
                            ),
                            kSizedBox(height: 6),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 85),
                                  child: Text(
                                    "Don't have an account? ",
                                    style: kMediumBlackTextStyle().apply(color: DescriptionGreyColor),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    kNavigator(context, Register());
                                  },
                                  child: Text(
                                    "Register",
                                    style: kMediumBlackTextStyle().apply(color: kBlueColor),
                                  ),
                                )
                              ],
                            )
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

  void login() async {
    var model = {"username": _nameController.text, "password": _passwordController.text};
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

  Widget _buildRememberMeRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Checkbox(
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return kGreyColor; // Color when checkbox is checked
              }
              return Colors.white; // Color when checkbox is unchecked
            }),
            checkColor: Colors.white, // The color of the check icon when the checkbox is checked

            // activeColor:
            //     Colors.white, // The color of the checkbox when it's checked
            // checkColor: Colors.black,
            value: _rememberMe,
            onChanged: (value) {
              setState(() {
                _rememberMe = value!;
              });
            },
          ),
          Padding(
            padding: kEdgeInsetsAll(1),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("Remember me", style: kMediumBlackTextStyle().apply(color: kGreyColor10)),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("Forgot Password?", style: kMediumBlackTextStyle().apply(color: kGreyColor10)),
              ),
            ),
          ).ripple(() {
            kNavigator(context, const ForgetPassword());
          }),
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
