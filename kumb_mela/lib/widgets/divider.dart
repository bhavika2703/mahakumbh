import 'package:flutter/material.dart';

import '../colors/light_colors.dart';
import '../theme/padding.dart';

Widget kVerticalDivider(
    {Color? color,
    EdgeInsetsGeometry? padding,
    double? height,
    double? thickness}) {
  return Padding(
    padding: padding ?? kEdgeInsetsSymmetricHV(),
    child: Divider(
      color: color ?? kGreyColor3,
      height: height ?? 1,
      thickness: thickness ?? 1,
    ),
  );
}

Widget kHorizontalDivider({
  double height = 10,
  Color? color,
  EdgeInsetsGeometry? margin,
}) {
  return Container(
    height: height,
    width: 1.0,
    color: color ?? kGreyColor4,
    margin: margin ?? const EdgeInsets.only(left: 10.0, right: 10.0),
  );
}
