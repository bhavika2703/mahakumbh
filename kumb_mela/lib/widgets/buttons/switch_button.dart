 import 'package:flutter/material.dart';
import 'package:kumb_mela/widgets/extensions.dart';

import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';

class WidgetSwitchButton extends StatelessWidget {
  final GestureTapCallback onTap1;
  final GestureTapCallback onTap2;
  final bool isActive;
  final String buttonName1;
  final String buttonName2;
  final EdgeInsetsGeometry? padding;

  const WidgetSwitchButton(
      {Key? key,
      required this.onTap1,
      required this.onTap2,
      required this.isActive,
      required this.buttonName1,
      required this.buttonName2,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: padding,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: kWhiteColor),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: kEdgeInsetsSymmetricHV(v: 2.8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: isActive ? kWhiteColor : kPrimaryColor),
              child: Text(
                buttonName1,
                style: kSemiBold1BlackTextStyle().apply(color: isActive ? kBlackColor : kWhiteColor),
              ),
            ).ripple(onTap1, borderRadius: const BorderRadius.all(Radius.circular(20))),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: kEdgeInsetsSymmetricHV(v: 2.8),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: isActive ? kPrimaryColor : kWhiteColor),
              child: Text(
                buttonName2,
                style: kSemiBold1BlackTextStyle().apply(color: isActive ? kWhiteColor : kBlackColor),
              ),
            ).ripple(onTap2, borderRadius: const BorderRadius.all(Radius.circular(20))),
          )
        ],
      ),
    );
  }
}
