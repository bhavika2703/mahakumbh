import 'package:flutter/material.dart';
import 'package:kumb_mela/widgets/extensions.dart';

import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';

class InkWellIconButton extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final GestureTapCallback onTap;
  final double? width;
  final bool isIconRight;
  final BoxBorder? border;
  final bool isWhiteColor;
  final Color? bgColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? hInnerPadding;
  final double? vInnerPadding;
  final double? hOuterPadding;
  final double? vOuterPadding;
  final double? borderRadius;
  final bool isLoading;
  final List<BoxShadow>? boxShadow;

  const InkWellIconButton({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
    this.width,
    this.isIconRight = true,
    this.border,
    this.isWhiteColor = false,
    this.textStyle,
    this.bgColor,
    this.hInnerPadding,
    this.vInnerPadding,
    this.hOuterPadding,
    this.vOuterPadding,
    this.borderRadius,
    this.iconColor,
    this.isLoading = false,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = borderRadius ?? 35;
    return Padding(
      padding: kEdgeInsetsSymmetricHV(v: vOuterPadding ?? 0.0, h: hOuterPadding ?? 0.0),
      child: Container(
        width: width,
        padding: kEdgeInsetsSymmetricHV(v: vInnerPadding ?? 2, h: (hInnerPadding ?? 2) + (radius > 9 ? 1 : 0)),
        decoration: BoxDecoration(
            color: bgColor ?? (isWhiteColor ? kWhiteColor : kPrimaryColor),
            shape: BoxShape.rectangle,
            boxShadow: boxShadow,
            border: border ?? Border.all(color: bgColor ?? kPrimaryColor),
            borderRadius: BorderRadius.circular(radius)),
        alignment: Alignment.center,
        child: iconData != null ? getTextIconButton : getTextButton,
      ).ripple(onTap, borderRadius: kBorderRadius(radius)),
    );
  }

  Widget get getTextButton {
    return TextButton(
      style: getButtonStyle,
      onPressed: onTap,
      child: Wrap(
        children: [
          getLabel,
          getLoading
        ],
      ),
    );
  }

  Widget get getTextIconButton {
    return Directionality(
      textDirection: isIconRight ? TextDirection.rtl : TextDirection.ltr,
      child: TextButton.icon(
        style: getButtonStyle,
        onPressed: onTap,
        icon: isLoading ? getLoading : getIcon,
        label: getLabel,
      ),
    );
  }

  Widget get getIcon {
    return Icon(
      iconData,
      color: isWhiteColor ? kGreyColor7 : iconColor ?? kWhiteColor,
      size: kSize(4.5),
    );
  }

  Widget get getLoading {
    if (isLoading) {
      return Padding(
        padding: kEdgeInsetsOnly(left:2,right: 2),
        child: SizedBox(
          width: kSize(5),
          height: kSize(5),
          child: const CircularProgressIndicator(
            color: kWhiteColor,
            strokeWidth: 3,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  ButtonStyle get getButtonStyle {
    return ButtonStyle(
      padding: MaterialStateProperty.all(kEdgeInsetsSymmetricHV(v: 0.0, h: 0.0)),
      minimumSize: MaterialStateProperty.all(Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: MaterialStateProperty.all(bgColor ?? (isWhiteColor ? kWhiteColor : kPrimaryColor)),
    );
  }

  Widget get getLabel {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
      style: textStyle ??
          kBoldBlackTextStyle().apply(
            color: iconColor ?? (isWhiteColor ? kGreyColor7 : kWhiteColor),
          ),
    );
  }
}
