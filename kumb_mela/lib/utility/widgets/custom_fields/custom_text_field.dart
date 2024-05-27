import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kumb_mela/colors/light_colors.dart';
import 'package:kumb_mela/theme/padding.dart';
import 'package:kumb_mela/theme/text_field_theme_data.dart';
import 'package:kumb_mela/theme/text_style.dart';

import '../../size_config.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final FocusNode? focusNodeNext;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final bool passwordVisible;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onFieldSubmitted;
  final bool isMandatory;
  final int maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enableInteractiveSelection;
  final bool isNumeric;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final bool autofocus;
  final bool? showCursor;
  final double? borderRadius;
  final String? initialValue;
  final String? validatorMsg;
  final Color? bgColor;
  final BorderSide? borderSide;
  final bool disableFocusNode;
  final bool isSentence;
  final EdgeInsetsGeometry? labelPadding;
  final bool isDatePicker;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.labelText,
    this.keyboardType,
    this.focusNode,
    this.focusNodeNext,
    this.validator,
    this.maxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.obscureText = false,
    this.passwordVisible = false,
    this.onFieldSubmitted,
    this.isMandatory = false,
    this.maxLines = 1,
    this.inputFormatters,
    this.enableInteractiveSelection,
    this.onTap,
    this.isNumeric = false,
    this.onChanged,
    this.enabled,
    this.initialValue,
    this.borderRadius = 10,
    this.validatorMsg,
    this.showCursor,
    this.minLines,
    this.bgColor,
    this.borderSide,
    this.autofocus = false,
    this.disableFocusNode = false,
    this.isSentence = false,
    this.labelPadding,
    this.isDatePicker = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null ? _label(labelText.toString()) : Container(),
        Theme(
          data: textFieldThemeData(
              radius: borderRadius,
              bgColor: bgColor,
              enableBorderSide: borderSide),
          child: Scrollbar(
            trackVisibility: true,
            radius: const Radius.circular(20),
            thickness: 3,
            child: SizedBox(
              // height: customDropdownTablet(),
              child: TextFormField(
                obscureText: obscureText,
                textAlign: TextAlign.left,
                controller: controller,
                focusNode:
                    disableFocusNode ? AlwaysDisabledFocusNode() : focusNode,
                autofocus: autofocus,
                textCapitalization: isSentence
                    ? TextCapitalization.sentences
                    : TextCapitalization.none,
                keyboardType: isNumeric
                    ? TextInputType.number
                    : keyboardType ?? TextInputType.text,
                textInputAction: textInputAction ?? TextInputAction.next,
                maxLength: maxLength ?? (isNumeric ? 10 : maxLength),
                validator: isMandatory && validator == null
                    ? validateIsNoEmpty
                    : validator,
                maxLines: maxLines,
                minLines: minLines,
                onChanged: onChanged,
                enabled: enabled,
                showCursor: showCursor,
                inputFormatters: isNumeric
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : inputFormatters,
                enableInteractiveSelection: disableFocusNode == true
                    ? false
                    : enableInteractiveSelection,
                onTap: onTap,
                initialValue: initialValue,
                decoration: InputDecoration(
                  counterText: '',
                  suffixIcon: isDatePicker
                      ? const Icon(Icons.calendar_month_sharp,
                          color: kBlackColor)
                      : suffixIcon,
                  prefixIcon: prefixIcon,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.0)),
                  hintText: hintText.isEmpty ? labelText : hintText,
                  hintStyle: kNormal1BlackTextStyle(color: kGreyColor6),
                  contentPadding: kEdgeInsetsSymmetricHV(
                      h: 3,
                      v: maxLines > 1
                          ? 3
                          : SizeConfig.screenWidth > 203
                              ? 4
                              : 0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String? validateIsNoEmpty(String? value) {
    if (value!.isEmpty) {
      return validatorMsg ?? "Field can't be empty";
    }
    return null;
  }

  Widget _label(String title) {
    return Padding(
      padding: labelPadding ??
          kEdgeInsetsOnly(
              bottom: 2,
              top: 4,
              left: borderRadius != null ? (borderRadius! > 20 ? 2 : 1) : 1),
      child: RichText(
        text: TextSpan(
            text: title,
            children: [
              TextSpan(
                  text: isMandatory ? ' *' : '',
                  style: TextStyle(color: Colors.red.shade700))
            ],
            style: kMedium1BlackTextStyle(color: appBlue)),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
