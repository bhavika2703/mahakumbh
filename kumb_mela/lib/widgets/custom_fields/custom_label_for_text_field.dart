import 'package:flutter/material.dart';

import '../../../theme/padding.dart';
import '../../../theme/text_style.dart';
import '../../colors/light_colors.dart';

class CustomLabelForTextField extends StatelessWidget {
  final String title;
  final bool isMandatory;
  final EdgeInsetsGeometry? labelPadding;
  final double? borderRadius;

  const CustomLabelForTextField(
      {Key? key, required this.title, required this.isMandatory, this.labelPadding, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: labelPadding ??
          kEdgeInsetsOnly(bottom: 2, top: 4, left: borderRadius != null ? (borderRadius! > 20 ? 2 : 1) : 1),
      child: RichText(
        text: TextSpan(
          text: title,
          children: [TextSpan(text: isMandatory ? ' *' : '', style: TextStyle(color: Colors.red.shade700))],
          style: kSemiBold1BlackTextStyle(color: kGreyColor8),
        ),
      ),
    );
  }
}
