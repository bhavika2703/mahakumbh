import 'package:flutter/material.dart';

import '../colors/light_colors.dart';
import '../theme/padding.dart';
import '../theme/text_style.dart';
import '../utility/size_config.dart';

PreferredSizeWidget appBarWhite({
  BuildContext? context,
  required String title,
  Widget? text,
  Color? iconColor,
  Color? backgroundColor,
  Color? iconBgColor,
  bool isBackButton = true,
  bool isCenterTitle = true,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    titleSpacing: 0.0,
    // title: text ?? Text(title, style: const TextStyle(color: kWhiteColor)),

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

PreferredSizeWidget appBarWithBackButton(
    {required String title, bool isBackButton = true, bool isCenterTitle = false, bool hasElevation = true}) {
  return AppBar(
    centerTitle: isCenterTitle ? true : false,
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: kMedium3BlackTextStyle(),
    ),
    leading: isBackButton ? const BackButton(color: kBlackColor ) : null,
    elevation: hasElevation ? 0.7 : 0.0,
    // leading: const BackButton(color: kBlackColor),
    backgroundColor: kWhiteColor,
  );
}

PreferredSizeWidget customAppBar(
    {BuildContext? context,
    required String? text,
    double? elevation = 0.5,
    PreferredSizeWidget? bottom,
    bool showBackButton = true,
    bool? centerTitle,
    double? toolbarHeight,
    Color? bgColor,
    Color? textColor,
    List<Widget>? actions}) {
  return AppBar(
    centerTitle: centerTitle,
    title: text != null ? Text(text, style: TextStyle(color: textColor ?? kWhiteColor)) : null,
    toolbarHeight: SizeConfig.screenWidth > 203 ? kSize(13) : kToolbarHeight,
    elevation: elevation,
    actions: actions,
    backgroundColor: bgColor ?? kPrimaryColor,
    bottom: bottom,
    leading: showBackButton ? BackButton(color: textColor ?? kWhiteColor) : null,
  );
}

PreferredSizeWidget kTabBar(
    {required List<Widget> tabs,
    TabController? controller,
    bool isScrollable = true,
    Color? selectTextColor,
    Color? ubSelectTextColor}) {
  return TabBar(
    labelColor: selectTextColor ?? kWhiteColor,
    labelStyle: kSemiBoldBlackTextStyle(color: selectTextColor ?? kWhiteColor),
    unselectedLabelStyle: kSemiBoldBlackTextStyle(color: ubSelectTextColor ?? kWhiteColor),
    isScrollable: isScrollable,
    tabs: tabs,
    tabAlignment: isScrollable ? TabAlignment.start : null,
    indicatorColor: kTabIndicatorColor,
    controller: controller,
  );
}
