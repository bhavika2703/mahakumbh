import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../colors/light_colors.dart';
import '../theme/padding.dart';
import '../theme/text_style.dart';
import '../utility/size_config.dart';

class WidgetProgressBar extends StatelessWidget {
  final bool isDarkBg;
  final String? title;
  final double? height;
  final Color? color;
  final Color? bgColor;
  final bool isExpanded;

  const WidgetProgressBar({
    Key? key,
    this.isDarkBg = false,
    this.title,
    this.height,
    this.color,
    this.bgColor,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDarkBg ? kGreyColor4.withOpacity(0.3) : kWhiteColor,
      child: Container(
        width: double.infinity,
        height: height ?? (isExpanded ? SizeConfig.screenHeight / 2 : null),
        color: isDarkBg ? kGreyColor4.withOpacity(0.3) : kWhiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(color: isDarkBg ? kBlackColor : kPrimaryColor),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title ?? "Loading...",
                style: kBold1BlackTextStyle().apply(color: isDarkBg ? kBlackColor : kPrimaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetAnimationProgressBar extends StatelessWidget {
  final bool isDarkBg;
  final String? title;
  final double? height;
  final Color? color;
  final Color? bgColor;
  final bool isExpanded;

  const WidgetAnimationProgressBar({
    Key? key,
    this.isDarkBg = false,
    this.title,
    this.height,
    this.color,
    this.bgColor,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDarkBg ? kGreyColor4.withOpacity(0.3) : kWhiteColor,
      child: Container(
        width: double.infinity,
        height: height ?? (isExpanded ? SizeConfig.screenHeight / 2 : null),
        color: isDarkBg ? kGreyColor4.withOpacity(0.3) : kWhiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: kPrimaryColor,
                size: kSize(8),
              ),
            ),
            // Center(
            //   child: CircularProgressIndicator(color: isDarkBg ? kBlackColor : kPrimaryColor),
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title ?? "Loading...",
                style: kBold1BlackTextStyle().apply(color: isDarkBg ? kBlackColor : kPrimaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
