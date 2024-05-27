import 'package:flutter/material.dart';

import '../../../theme/text_field_theme_data.dart';
import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';
import '../../utility/size_config.dart';

class CustomLoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool autofocus;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final bool passwordVisible;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onFieldSubmitted;
  final Iterable<String>? autofillHints;

  const CustomLoginTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
    this.focusNode,
    this.validator,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.passwordVisible = false,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(labelText.toString()),
        Theme(
          data: loginTextFieldTheme(),
          child: TextFormField(
            textAlign: TextAlign.left,
            // autofocus: autofocus,
            controller: controller,
            obscureText: passwordVisible,
            maxLength: maxLength,
            decoration: InputDecoration(
              contentPadding: SizeConfig.screenWidth > 203 ? kEdgeInsetsSymmetricHV(h: 2, v: 2) : null,
              hintText: hintText,
              counterText: '',
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
            keyboardType: keyboardType ?? TextInputType.text,
            autofillHints: autofillHints,
            focusNode: focusNode,
            textInputAction: textInputAction,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
            style: kSemiBold3BlackTextStyle(),
          ),
        ),
      ],
    );
  }

  Widget _label(String title) {
    return Padding(
      padding: kEdgeInsetsOnly(top: 3, bottom: 1),
      child: Text(
        title,
        style: kBold1BlackTextStyle(color: kGreyColor9),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
