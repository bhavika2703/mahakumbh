import 'package:flutter/material.dart';

import '../utility/size_config.dart';

var _hBlock = SizeConfig.safeBlockHorizontal;

EdgeInsets kEdgeInsetsSymmetricHV({double h = 0.0, double v = 0.0}) {
  return EdgeInsets.symmetric(horizontal: _hBlock * h, vertical: _hBlock * v);
}

EdgeInsets kEdgeInsetsVertical({double v = 1.0}) {
  return EdgeInsets.symmetric(vertical: _hBlock * v);
}

EdgeInsets kEdgeInsetsAll(double v) {
  return EdgeInsets.all(_hBlock * v);
}

EdgeInsets kEdgeInsetsOnly(
    {double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0}) {
  return EdgeInsets.fromLTRB(
      _hBlock * left, _hBlock * top, _hBlock * right, _hBlock * bottom);
}

BorderRadius kBorderRadius10() => BorderRadius.circular(10);
BorderRadius kBorderRadiusOnly(
    {double bottomLeft = 0.0,
      double bottomRight = 0.0,
      double topLeft = 0.0,
      double topRight = 0.0}) =>
    BorderRadius.only(
        bottomRight: Radius.circular(bottomRight),
        bottomLeft: Radius.circular(bottomLeft),
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight));


BorderRadius kBorderRadius(double d) => BorderRadius.circular(d);

double kHeight(double d) => _hBlock * d;

double kSize(double d) => _hBlock * d;

Widget kSizedBox({double height = 0.0, double width = 0.0}) =>
    SizedBox(height: _hBlock * height, width: _hBlock * width);
