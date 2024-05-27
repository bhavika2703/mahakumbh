import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/screens/login_screens/otp_screen.dart';
import 'package:kumb_mela/theme/navigator.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/theme/text_style.dart';
import 'package:kumb_mela/utility/app_bar_widget.dart';
import 'package:kumb_mela/widgets/custom_fields/custom_button.dart';

import '../../Utility/constant.dart';
import '../../utility/widgets/custom_fields/custom_text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _phoneController = TextEditingController();

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
                        padding: kEdgeInsetsAll(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kSizedBox(height: 2),
                            Text("Forgot Password", style: kBold3BlackTextStyle().apply(color: kGreyColor10)),
                            kSizedBox(height: 2),
                            Text(
                                "Enter the email address or phone number with your account & we’ll send confirmation code to reset your password",
                                style: kMedium2BlackTextStyle().apply(color: kGreyColor10)),
                            kSizedBox(height: 8),
                            CustomTextField(
                                bgColor: kBlackColor,
                                controller: _phoneController,
                                suffixIcon: IconButton(
                                  icon: Image.asset(Assets.icContact, color: kGreyColor, height: kSize(6), width: kSize(6)),
                                  onPressed: () {},
                                ),
                                // labelText: "UserName",
                                isMandatory: true,
                                hintText: "Mobile Number /Email"),
                            // CustomLoginTextField(
                            //   controller: _phoneController,
                            //   hintText: "   Mobile Number /Email",
                            //   labelText: "",
                            //   suffixIcon: const Icon(Icons.contact_page_rounded),
                            // ),
                            kSizedBox(height: 6),
                            CustomButton(
                                title: "Send Code",
                                onPressed: () {
                                  kNavigator(context, const OtpScreen());
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
