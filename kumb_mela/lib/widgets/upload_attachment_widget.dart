import 'dart:io';

 import 'package:flutter/material.dart';
import 'package:kumb_mela/widgets/extensions.dart';

import '../colors/light_colors.dart';
import '../theme/padding.dart';
import '../theme/text_style.dart';
import '../utility/constant.dart';

class WidgetUploadAttachment extends StatelessWidget {
  final File selectedFile;
  final bool isDocument;
  final Function onPressed;

  const WidgetUploadAttachment({Key? key, required this.selectedFile, required this.isDocument, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kEdgeInsetsSymmetricHV(h: 2, v: 1),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: kGreyColor4, width: 2)),
      child: SizedBox(
        width: double.infinity,
        // decoration: const BoxDecoration(color: kWhiteColor),
        child: selectedFile.path.isNotEmpty
            ? isDocument
                ? Padding(
                    padding: kEdgeInsetsSymmetricHV(v: 5),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: kWhiteColor,
                          ),
                          child: Image.asset(
                            Assets.icFile,
                            color: kBlueGreyColor6,
                            width: kSize(10),
                            height: kSize(10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            selectedFile.path.split("/").last,
                            style: kMedium2BlackTextStyle().apply(color: kGreyColor4),
                          ),
                        ),
                      ],
                    ),
                  )
                : Image.file(
                    selectedFile,
                    width: double.infinity,
                    height: kSize(42),
                    fit: BoxFit.fitWidth,
                  )
            : Padding(
                padding: kEdgeInsetsSymmetricHV(v: 2, h: 4),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: kPrimaryDarkColor),
                      child: Padding(
                        padding: kEdgeInsetsSymmetricHV(h: 2, v: 2),
                        child: Text(
                          "Choose File",
                          textAlign: TextAlign.center,
                          style: kMedium1BlackTextStyle().apply(color: kWhiteColor),
                        ),
                      ),
                    ).ripple(onPressed),
                    const Expanded(child: SizedBox()),
                    Text(
                      "No file Chosen",
                      style: kBold3BlackTextStyle(),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
