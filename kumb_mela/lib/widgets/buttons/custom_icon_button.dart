import 'package:flutter/material.dart';
import 'package:kumb_mela/widgets/extensions.dart';

import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../cached_network.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final double hPadding;
  final double vPadding;
  final double? size;
  final Color? color;
  final Function onPressed;
  final String? imageIconPath;
  final String? networkImage;
  final Color? bgColor;
  final double? borderRadius;
  final double? innerPadding;
  final List<BoxShadow>? boxShadow;

  const CustomIconButton({
    Key? key,
    required this.iconData,
    this.color,
    required this.onPressed,
    this.hPadding = 1,
    this.vPadding = 2,
    this.imageIconPath,
    this.size,
    this.bgColor,
    this.borderRadius,
    this.innerPadding,
    this.boxShadow,
    this.networkImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kEdgeInsetsSymmetricHV(v: vPadding, h: hPadding),
      child: Container(
              padding: kEdgeInsetsAll(innerPadding ?? 1.5),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: kBorderRadius(borderRadius ?? 40),
                boxShadow: boxShadow,
              ),
              child: checkImage())
          .ripple(onPressed, borderRadius: kBorderRadius(borderRadius ?? 40)),
    );
  }

  checkImage() {
    if (networkImage != null) {
      return ClipRRect(
        borderRadius: kBorderRadius(10),
        child: WidgetCachedNetwork(
          size: kSize(8),
          fit: BoxFit.fill,
          url: networkImage.toString(),
        ),
      );
    } else if (imageIconPath != null) {
      return Image.asset(
        imageIconPath!,
        width: size ?? kSize(6),
        height: size ?? kSize(6),
      );
    } else {
      return Icon(
        iconData,
        color: color ?? kGreyColor4,
        size: size ?? kSize(6),
      );
    }
  }
}
