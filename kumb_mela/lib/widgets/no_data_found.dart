import 'package:flutter/material.dart';

import '../theme/padding.dart';
import '../utility/size_config.dart';

class WidgetNoDataFound extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final double? height;

  const WidgetNoDataFound(
      {Key? key, required this.title, this.isExpanded = false, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? (isExpanded ? SizeConfig.screenHeight / 2 : null),
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: kEdgeInsetsSymmetricHV(h: 2, v: 2),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.body3FontSize),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
