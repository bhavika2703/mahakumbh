import 'package:flutter/material.dart';
import 'package:kumb_mela/colors/extenstion.dart';
import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kEdgeInsetsSymmetricHV(h: 2, v: 2),
      child: Container(
        padding: kEdgeInsetsSymmetricHV(v: 3),
        decoration: BoxDecoration(
          color: kPrimaryOrangeColor,
          borderRadius: kBorderRadius(5),
          // boxShadow: [
          //   BoxShadow(
          //       offset: const Offset(3, 5),
          //       color: kGreyColor3,
          //       blurRadius: 12,
          //       spreadRadius: 3)
          // ]
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: kBold1BlackTextStyle().apply(color: kWhiteColor),
        ),
      ).ripple(onPressed, borderRadius: kBorderRadius(35)),
    );

/*    Padding(
      padding:kEdgeInsetsSymmetricsHV(h: 2,v: 2),
      child: Container(
        padding: kEdgeInsetsSymmetricHV(v: 3),
        decoration: BoxDecoration(
            color: kPrimaryDarkColor,
            borderRadius: kBorderRadius(35),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(3, 5),
                  color: kGreyColor3,
                  blurRadius: 12,
                  spreadRadius: 3)
            ]),
        alignment: Alignment.center,
        child: Text(
          title,
          style: kBold1BlackTextStyle().apply(color: kWhiteColor),
        ),
      ).ripple(onPressed,borderRadius: kBorderRadius(35)),
    );*/
  }
}
