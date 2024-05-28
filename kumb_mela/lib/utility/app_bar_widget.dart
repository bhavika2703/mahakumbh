import 'package:flutter/material.dart';

import '../colors/light_colors.dart';
import '../theme/text_style.dart';

PreferredSizeWidget appBarWhite({
  BuildContext? context,
  required String title,
  Widget? text,
  Color? iconColor,
  Color? backgroundColor,
  Color? iconBgColor,
  PreferredSizeWidget? bottom,
  bool isBackButton = true,
  bool isCenterTitle = true,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    titleSpacing: 0.0,
    // title: text ?? Text(title, style: const TextStyle(color: kWhiteColor)),
    bottom: bottom,
    title: text ??
        Text(
          title,
          style: kSemiBold4BlackTextStyle(color: getComfortableTextColor(backgroundColor ?? kWhiteColor)),
        ),
    actions: actions,
    elevation: 0.0,
    leading: isBackButton ? BackButton(color: iconColor ?? getComfortableTextColor(backgroundColor ?? kWhiteColor)) : null,
    centerTitle: isCenterTitle ? true : false,
    backgroundColor: backgroundColor ?? kWhiteColor,
  );
}
