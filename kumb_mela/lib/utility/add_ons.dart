

import 'package:intl/intl.dart';

String getStudentName(var model) => model['student'] != null
    ? model['student']['users'] != null
        ? model['student']['users']['name'] ?? ""
        : ""
    : "";

String getStudentImage(var model) => model['student_session'] != null
    ? model['student_session']['student'] != null
        ? model['student_session']['student']['image'] ?? ""
        : ""
    : "";

final indianRupeesFormat = NumberFormat.currency(
  symbol: '₹ ',
  locale: "HI",
  decimalDigits: 0,
);

String formatCurrency(var value) {
  return indianRupeesFormat.format(checkInteger(value));
}

String checkDouble(dynamic value) {
  String s = "0";
  if (value == null || value.toString().isEmpty) {
    s = "0.0";
  } else if (value is double) {
    s = value.toStringAsFixed(2);
  } else if (value is int) {
    s = value.toDouble().toString();
  } else {
    s = value;
  }
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
  return s.toString().replaceAll(regex, '');
}

int checkInteger(dynamic value) {
  if (value == null) {
    return 0;
  } else if (value.toString().isEmpty) {
    return 0;
  } else if (RegExp(r'^[a-zA-Z]+').hasMatch(value.toString())) {
    return 0;
  } else if (value is String) {
    return double.parse(value).round();
  } else if (value is double) {
    return value.round();
  } else {
    return value;
  }
}

String? checkIntegerWithNull(dynamic value) {
  try {
    if (value == null) {
      return "0";
    } else if (value is String) {
      return double.parse(value).round().toString();
    } else if (value is double) {
      return value.round().toString();
    } else {
      return value.toString();
    }
  } catch (e) {
    return null;
  }
}

bool checkNull(var s) {
  return s != null && s.toString().trim().isNotEmpty;
}

checkNullEmpty(var s) {
  if (s != null && s.toString().trim().isNotEmpty) {
    return s.toString().trim();
  } else {
    return null;
  }
}
