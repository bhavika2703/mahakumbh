import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kumb_mela/constatns.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/custom_button/custom_button.dart';
import 'package:kumb_mela/custom_button/custom_button_otp.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/utility/widgets/app_constant.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: ListView(children: [
          kSizedBox(height: 5.0),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: kEdgeInsetsAll(2),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Image.asset(
                        Assets.logo,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                kSizedBox(height: 50.0),
              ],
            ),
          ),
          Text(
            'Verify your identity for added security.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          kSizedBox(height: 5.0),
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
                      content: Text('Code entered is $verificationCode'),
                    );
                  });
            }, // end onSubmit
          ),
          kSizedBox(height: 5),
          CustomButton2(
              title: AppConstant.otpButtonText,
              onPressed: () {
                if (_formGlobalKey.currentState!.validate()) {
                  // otp();
                }
              }),
          kSizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t Received OTP? ',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle Register navigation
                },
                child: Text(
                  'Resend',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
