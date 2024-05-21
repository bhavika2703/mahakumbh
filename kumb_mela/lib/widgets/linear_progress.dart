import 'package:flutter/material.dart';

import '../colors/light_colors.dart';

class WidgetLinearProgress extends StatelessWidget {
  final bool isVisible;
  final bool isPrimaryBg;

  const WidgetLinearProgress({Key? key, required this.isVisible, this.isPrimaryBg = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isPrimaryBg ? kPrimaryColor : null,
      height: 3,
      child: Visibility(
        visible: isVisible,
        maintainSize: true,
        maintainState: true,
        maintainAnimation: true,
        child: LinearProgressIndicator(
            minHeight: 3,
            valueColor: AlwaysStoppedAnimation<Color>(isPrimaryBg ? kWhiteColor : kSecondaryColor),
            backgroundColor: isPrimaryBg ? kWhiteColor : kPrimaryColor),
      ),
    );
  }
}
