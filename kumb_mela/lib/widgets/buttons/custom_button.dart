 import 'package:flutter/material.dart';
import 'package:kumb_mela/widgets/extensions.dart';

import '../../../../colors/light_colors.dart';
import '../../../theme/padding.dart';
import '../../../theme/text_style.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? textcolor;
  final Function onPressed;

  const CustomButton({Key? key, required this.title, required this.onPressed, this.color, this.textcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kEdgeInsetsSymmetricHV(h: 2, v: 2),
      child: Container(
        padding: kEdgeInsetsSymmetricHV(v: 3),
        decoration: BoxDecoration(
            color: color ?? kPrimaryColor,
            borderRadius: kBorderRadius(10),
            boxShadow: [BoxShadow(offset: const Offset(3, 5), color: kGreyColor3, blurRadius: 12, spreadRadius: 3)]),
        alignment: Alignment.center,
        child: Text(
          title,
          style: kBold1BlackTextStyle().apply(color:textcolor?? kWhiteColor),
        ),
      ).ripple(onPressed, borderRadius: kBorderRadius(35)),
    );

/*    Padding(
      padding:kEdgeInsetsSymmetricHV(h: 2,v: 2),
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
