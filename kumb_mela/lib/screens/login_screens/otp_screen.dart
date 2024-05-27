import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';
import '../../utility/app_bar_widget.dart';
import '../../widgets/custom_fields/custom_button.dart';

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
        backgroundColor: kBlackColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: kEdgeInsetsAll(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kSizedBox(height: 2),
                Text("Please check your email", style: kBold3BlackTextStyle().apply(color: kGreyColor)),
                kSizedBox(height: 2),
                Text("We have send the code to Econn@gmail.com", style: kMedium2BlackTextStyle().apply(color: kGreyColor10)),
                kSizedBox(height: 4),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: kEdgeInsetsSymmetricHV(h: 4, v: 4),
                      child: OtpTextField(
                        // clearText: clear,
                        focusedBorderColor: kPrimaryDarkColor,
                        numberOfFields: 6,
                        borderColor: kPrimaryDarkColor,
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
                    Text("Send Code again - 00:34", style: kSemiBold1BlackTextStyle().apply(color: kGreyColor10)),
                    kSizedBox(height: 6),
                  ],
                ),
                CustomButton(title: "Verification", onPressed: () {})
              ],
            ),
          ),
        ));
  }
}
