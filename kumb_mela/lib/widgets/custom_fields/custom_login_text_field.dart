import 'package:flutter/material.dart';

import '../../../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';
import '../../utility/constant.dart';
import '../../utility/validate.dart';

class CustomLoginTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final FocusNode? focusNodeNext;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final bool passwordVisible;
  final Widget? suffixIcon;
  final bool disableFocusNode;
  final Widget? prefixIcon;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final bool isMandatory;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final double contentVerticalPadding;
  final bool? enableInteractiveSelection;
  final int? maxLine;
  final GestureTapCallback? onTap;
  final bool? enable;
  final String imagePath;
  final Iterable<String>? autofillHints;

  const CustomLoginTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
    this.focusNode,
    this.maxLine,
    this.focusNodeNext,
    this.validator,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.passwordVisible = false,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.isMandatory = true,
    this.enableInteractiveSelection,
    this.onTap,
    this.contentVerticalPadding = 0,
    this.onChanged,
    this.autoFocus = false,
    this.disableFocusNode = false,
    this.minLines,
    this.enable,
    required this.imagePath, this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kEdgeInsetsOnly(bottom: 2, top: 2),
      padding: kEdgeInsetsSymmetricHV(v: 1.5, h: 2),
      decoration: BoxDecoration(border: Border.all(color: kGreyColor4), borderRadius: kBorderRadius(12)),
      child: Row(
        children: [
          Padding(
            padding: kEdgeInsetsAll(2),
            child: Image.asset(imagePath, height: kSize(10), width: kSize(6)),
          ),
          kHorizontalDivider(height: 30, color: kGreyColor7),
          Expanded(
            child: TextFormField(
              autofocus: autoFocus,
              textAlign: TextAlign.left,
              controller: controller,
              obscureText: passwordVisible,
              maxLength: maxLength,
              maxLines: maxLines,
              minLines: minLines,
              onChanged: onChanged,
              enabled: enable,
              autofillHints: autofillHints,
              decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding: kEdgeInsetsSymmetricHV(h: 3, v: (maxLines ?? 1) > 1 ? 2 : 0),
                  counterText: '',
                  suffixIcon: suffixIcon,
                  labelText: labelText,
                  labelStyle: kMedium1BlackTextStyle(color: kGreyColor7),
                  prefixIcon: prefixIcon,
                  border: InputBorder.none),
              enableInteractiveSelection: disableFocusNode == true ? false : enableInteractiveSelection,
              onTap: onTap,
              keyboardType: keyboardType,
              focusNode: disableFocusNode ? AlwaysDisabledFocusNode() : focusNode,
              textInputAction: textInputAction,
              validator: isMandatory && validator == null ? Validator().validateIsNoEmpty : validator,
              onFieldSubmitted: onFieldSubmitted,
              style: kSemiBold1BlackTextStyle(color: (enable ?? true) ? kBlackColor : kGreyColor6),
            ),
          ),
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
