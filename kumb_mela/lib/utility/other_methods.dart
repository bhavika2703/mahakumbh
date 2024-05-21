import 'package:flutter/services.dart';
import 'package:html/parser.dart';

void hideKeyboard() {
  Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
  // if (FocusManager.instance.primaryFocus != null) {
  //   FocusManager.instance.primaryFocus!.unfocus();
  // }
}

convertCapitalLetter(String data) {
  if (isUpperCase(data)) {
    return data;
  }
  if (data.length > 1) {
    return "${data[0].toUpperCase()}${data.substring(1).toLowerCase()}";
  } else {
    return data;
  }
}

bool isUpperCase(String? string) {
  if (string == null) {
    return false;
  }
  if (string.isEmpty) {
    return false;
  }
  if (string.trimLeft().isEmpty) {
    return false;
  }
  String firstLetter = string.trimLeft().substring(0, 1);
  if (double.tryParse(firstLetter) != null) {
    return false;
  }
  return firstLetter.toUpperCase() == string.substring(0, 1);
}

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString /*.replaceAll("\n", "")*/;
}
