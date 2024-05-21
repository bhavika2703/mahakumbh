import 'package:flutter/material.dart';

import '../colors/light_colors.dart';
import '../theme/padding.dart';
import '../theme/text_style.dart';

class WidgetDownloadProgress extends StatelessWidget {
  final String msg;

  const WidgetDownloadProgress({Key? key, this.msg = 'Downloading...'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGreyColor8.withOpacity(0.4),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  padding: kEdgeInsetsSymmetricHV(v: 8, h: 7),
                  decoration: BoxDecoration(color: kWhiteColor, borderRadius: kBorderRadius10()),
                  child: Column(
                    children: [const CircularProgressIndicator(), kSizedBox(height: 8), Text(msg, style: kBold2BlackTextStyle())],
                  ))),
        ],
      ),
    );
  }
}
