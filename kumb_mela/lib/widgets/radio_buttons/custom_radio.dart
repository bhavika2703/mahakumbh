import 'package:flutter/material.dart';

import '../../../theme/padding.dart';
import '../../colors/light_colors.dart';
import '../../theme/text_style.dart';
import '../custom_fields/custom_label_for_text_field.dart';

class CustomRadio extends StatelessWidget {
  final String labelText;
  final ValueChanged onChanged;
  final bool mandatory;
  final String? value;
  final Object? groupValue;
  final List<String> list;

  const CustomRadio(
      {Key? key,
      required this.labelText,
      required this.onChanged,
      this.mandatory = false,
      this.value,
      required this.groupValue,
      required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabelForTextField(
          title: labelText.toString(),
          isMandatory: mandatory,
        ),
        Padding(
          padding: kEdgeInsetsSymmetricHV(h: 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list.map((data) {
              return Row(
                children: [
                  Radio(
                    fillColor: MaterialStatePropertyAll(kPrimaryColor),
                    groupValue: list.contains(groupValue.toString()) ? groupValue : null,
                    value: data,
                    onChanged: onChanged,
                  ),
                  Text(
                    data,
                    style: kNormalBlackTextStyle(),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
