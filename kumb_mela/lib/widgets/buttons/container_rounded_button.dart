 import 'package:flutter/material.dart';
import 'package:kumb_mela/widgets/extensions.dart';

import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';
import '../../utility/size_config.dart';

class ContainerRoundedButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final double borderRadius;
  final Color color;
  final bool isLoading;

  const ContainerRoundedButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.borderRadius = 10.0,
      this.color = const Color(0xff0082D6),
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: isLoading
          ? SizedBox(
              height: kSize(6),
              width: kSize(6),
              child: const CircularProgressIndicator(
                color: kWhiteColor,
                strokeWidth: 2.5,
              ))
          : Text(
              title,
              style: kBold2BlackTextStyle().apply(color: kWhiteColor),
            ),
    ).ripple(onTap, borderRadius: BorderRadius.circular(25.0));
  }
}
