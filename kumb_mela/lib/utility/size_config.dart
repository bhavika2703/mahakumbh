import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static late double body0FontSize;
  static late double bodyFontSize;
  static late double body1FontSize;
  static late double body2FontSize;
  static late double body3FontSize;
  static late double body4FontSize;
  static late double body5FontSize;
  static late double heading4FontSize;
  static late double heading5FontSize;
  static late double heading6FontSize;
  static late bool isPortraitOrientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    isPortraitOrientation = _mediaQueryData.orientation == Orientation.portrait;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal =
        isPortraitOrientation ? (screenWidth - _safeAreaHorizontal) / 100 : (screenHeight - _safeAreaVertical) / 100;
    // safeBlockHorizontal  = 4.0;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    body0FontSize = safeBlockHorizontal * 3.0;
    bodyFontSize = safeBlockHorizontal * 3.5; //13.99
    body1FontSize = safeBlockHorizontal * 3.8; //15.19
    body2FontSize = safeBlockHorizontal * 4.0; //15.99
    body3FontSize = safeBlockHorizontal * 4.2; //16.79
    body4FontSize = safeBlockHorizontal * 5.0; //16.79
    body5FontSize = safeBlockHorizontal * 6.0; //16.79
    heading6FontSize = safeBlockHorizontal * 5.0; //19.99
    heading5FontSize = safeBlockHorizontal * 5.5; //21.99
    heading4FontSize = safeBlockHorizontal * 7.5; //29.99
  }
}
