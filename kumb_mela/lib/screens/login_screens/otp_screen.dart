import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kumb_mela/theme/navigator.dart';

import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';
import '../../utility/app_bar_widget.dart';
import '../../widgets/custom_fields/custom_button.dart';
import 'create_new_password.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String verificationCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWhite(title: "", backgroundColor: kBlackColor),
         body: Container(
           decoration: kGradientBoxDecoration(),
           child: Stack(
             children: [
               Column(
                 children: [
                   Expanded(
                     child: SingleChildScrollView(
                      child: Padding(
                        padding: kEdgeInsetsAll(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kSizedBox(height: 2),
                            Text("Please check your email", style: kBold3BlackTextStyle().apply(color: kGreyColor)),
                            kSizedBox(height: 2),
                            Row(
                              children: [
                                Text("We have send the code to ", style: kMedium2BlackTextStyle().apply(color: kGreyColor10)),
                                Text("Econn@gmail.com", style: kMedium2BlackTextStyle().apply(color: kGreyColor)),
                              ],
                            ),
                            kSizedBox(height: 4),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: kEdgeInsetsSymmetricHV(h: 4, v: 4),
                                  child: OtpTextField(
                                    borderRadius: kBorderRadius10(),
                                    // clearText: clear,
                                    focusedBorderColor: kGreyColor,
                                    numberOfFields: 6,
                                    fillColor: kPrimaryColor3,
                                    textStyle: kBold2BlackTextStyle().apply(color: kWhiteColor),
                                    borderColor: kPrimaryColor3,
                                    showFieldAsBox: true,
                                    onCodeChanged: (code) {
                                      if (code.length == 5) {
                                        FocusScope.of(context).requestFocus(FocusNode());
                                        // verifyPhoneNumberWithOtp();
                                      }
                                    },
                                    onSubmit: (code) {
                                      setState(() {
                                        verificationCode = code;
                                      });
                                      // verifyPhoneNumberWithOtp();
                                    }, // end onSubmit
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Send Code again -", style: kSemiBold1BlackTextStyle().apply(color: kGreyColor)),
                                    Text(" 00:34", style: kSemiBold1BlackTextStyle().apply(color: kGreyColor10)),
                                  ],
                                ),
                                kSizedBox(height: 6),
                              ],
                            ),
                            CustomButton(
                                title: "Verification",
                                onPressed: () {
                                  kNavigator(context, const ConfirmPassword());
                                })
                          ],
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
}
