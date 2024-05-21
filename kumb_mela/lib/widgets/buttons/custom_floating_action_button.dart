import 'package:flutter/material.dart';

import '../../colors/light_colors.dart';
import '../../theme/text_style.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? color;
  final bool hideButton;
  final String? label;

  const CustomFAB({
    Key? key,
    required this.onPressed,
    this.icon = Icons.add_outlined,
    this.color,
    this.hideButton = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hideButton) {
      return Container();
    }
    if (label != null) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: FloatingActionButton.extended(
          heroTag: null,
          backgroundColor: color ?? kPrimaryColor,
          shape: const CircleBorder(),
          onPressed: onPressed,
          label: Text(label!, style: kBold1BlackTextStyle(color: kWhiteColor)),
          icon: const Icon(Icons.add),
        ),
      );
    } else {
      return FloatingActionButton(
        heroTag: null,
        backgroundColor: color ?? Colors.yellow.shade700,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: Icon(icon, size: 30),
      );
    }
  }
}
