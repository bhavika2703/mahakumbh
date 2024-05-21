import 'package:flutter/material.dart';

import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? iconData;
  final bool hasIcon;
  final double? iconSize;
  final Color? iconColor;

  const CustomTextButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.textStyle,
      this.backgroundColor,
      this.textColor,
      this.iconData,
      this.hasIcon = false,
      this.iconSize,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(

      style: ButtonStyle(

          shape:
              MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0))),
          padding: MaterialStateProperty.all(hasIcon ? kEdgeInsetsOnly(left: 2) : kEdgeInsetsSymmetricHV(v: 0.5, h: 2)),
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? kGreyColor.withOpacity(0.2))),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: textStyle ?? kMedium2BlackTextStyle(color: textColor ?? kWhiteColor),
          ),
          if (hasIcon)
            Padding(
              padding: kEdgeInsetsOnly(left: 2, right: 2),
              child: Icon(
                iconData ?? Icons.keyboard_arrow_right,
                color: iconColor ?? (textColor ?? kGreyColor6),
                size: iconSize,
              ),
            )
        ],
      ),
    );
  }
}
