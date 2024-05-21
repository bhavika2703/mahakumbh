import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../colors/light_colors.dart';
import '../theme/text_style.dart';

String convertDateWithTodayStamp(String date) {
  try {
    var inputDate = DateTime.parse(date);
    var currentDate = DateTime.now();
    // return DateFormat('dd-MMM-yyyy').format(inputDate);
    if (DateTime(inputDate.year, inputDate.month, inputDate.day) ==
        DateTime(currentDate.year, currentDate.month, currentDate.day).subtract(const Duration(days: 1))) {
      return "Yesterday";
    } else if (DateTime(inputDate.year, inputDate.month, inputDate.day) !=
        DateTime(currentDate.year, currentDate.month, currentDate.day)) {
      return DateFormat('dd-MMM-yyyy').format(inputDate);
    } else {
      return "Today";
    }
  } on Exception {
    return date;
  }
}

String convertDateMonthYear(var date) {
  if (date != null) {
    try {
      var formattedDate = DateTime.parse(date.toString());
      return DateFormat('MMMM, yyyy').format(formattedDate);
    } on Exception {
      return date;
    }
  } else {
    return '';
  }
}

String convertDateWithDdDash(var date) {
  if (date != null) {
    try {
      var formattedDate = DateTime.parse(date.toString());
      return DateFormat('dd-MMM-yyyy').format(formattedDate);
    } on FormatException {
      return date;
    }
  } else {
    return '';
  }
}

String convertDateWithTime(var date) {
  if (date != null) {
    try {
      var formattedDate = DateTime.parse(date.toString());
      return DateFormat('dd-MMM-yyyy | hh:mm a').format(formattedDate);
    } on FormatException {
      return date;
    }
  } else {
    return '';
  }
}

String convertTime(var date) {
  if (date != null) {
    try {
      var time = DateFormat.Hms().parse(date.toString());
      return DateFormat('h:mm a').format(time);
    } on FormatException {
      return date;
    }
  } else {
    return '';
  }
}

String convertDateWithDdMmmYyyyDashWithOutYear(var date) {
  try {
    var formattedDate = DateTime.parse(date.toString());
    return DateFormat('dd MMM').format(formattedDate);
  } on Exception {
    return date;
  }
}

String convertDateWithMmmYyyyDashWithOutYear(var date) {
  try {
    var formattedDate = DateTime.parse(date.toString());
    return DateFormat('MMM yyyy').format(formattedDate);
  } on Exception {
    return date;
  }
}
String convertDateDmy(DateTime date) {
  return DateFormat('dd-MM-yyyy').format(date);
}

String convertYmd(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

String convertDateWithDdMmmDash(var date) {
  if (date != null) {
    try {
      var formattedDate = DateTime.parse(date.toString());
      return DateFormat('dd-MMM').format(formattedDate);
    } on FormatException {
      return date;
    }
  } else {
    return '';
  }
}

String convertHourFormat(String? time) {
  if (time != null) {
    try {
      return DateFormat("hh:mm a").format(convert24TimeToDate(time));
    } on FormatException {
      return time;
    }
  }
  return "N/A";
}

DateTime convertDate(var date) {
  if (date != null) {
    try {
      var inputDate = DateTime.parse(date.toString());
      return inputDate;
    } on Exception {
      return DateTime.now();
    }
  } else {
    return DateTime.now();
  }
}

DateTime convert24TimeToDate(String? date) {
  var inputDate = DateTime.now();
  if (date != null) {
    try {
      inputDate = DateTime.parse(DateFormat("HH:mm:ss").parse(date).toString());
      return inputDate;
    } on FormatException {
      return inputDate;
    }
  } else {
    return inputDate;
  }
}


String getDobDate(String? date) {
  try {
    DateTime inputDate = DateTime.now();
    if (date != null) {
      DateTime dob = DateTime.parse(date);
      inputDate = DateTime(DateTime.now().year, dob.month, dob.day);
    }

    var currentDate = DateTime.now();
    if (DateTime(inputDate.year, inputDate.month, inputDate.day) ==
        DateTime(currentDate.year, currentDate.month, currentDate.day).add(const Duration(days: 1))) {
      return "Tomorrow";
    } else if (DateTime(inputDate.year, inputDate.month, inputDate.day) !=
        DateTime(currentDate.year, currentDate.month, currentDate.day)) {
      return DateFormat('dd MMM yyyy').format(DateTime.parse(date.toString()));
    } else {
      return "Today";
    }
  } on Exception {
    return date ?? '';
  }
}

String convertDateWithFullMonthYear(String date) {
  try {
    var formattedDate = DateTime.parse(date);
    return DateFormat('dd MMMM yyyy').format(formattedDate);
  } on Exception {
    return date;
  }
}

Future<DateTime?> kDatePicker(
    {required BuildContext context,
    required DateTime initialDate,
    DateTime? firstDate,
    DateTime? lastDate}) async {
  return await showDatePicker(
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: kPrimaryColor,
            onPrimary: kWhiteColor,
            onSurface: kPrimaryDarkColor,
          ),
          textTheme: kDefaultTextTheme,
        ),
        child: child!,
      );
    },
    context: context,
    initialDate: initialDate,
    firstDate: firstDate ?? DateTime(1970),
    lastDate: lastDate ?? DateTime(2050),
  );
}
