 import 'package:flutter/material.dart';

import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../../theme/text_style.dart';
import '../../widgets/buttons/ink_well_icon_button.dart';
 import '../custom_fields/custom_label_for_text_field.dart';

class ShowDeleteAlertDialog extends StatelessWidget {
  final String? message;
  final String? okayButtonTitle;
  final Color? okayButtonColor;

  const ShowDeleteAlertDialog({super.key, this.message, this.okayButtonTitle, this.okayButtonColor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Are you sure?",
        style: kBold3BlackTextStyle(),
      ),
      content: Text(
        message ?? "Once deleted, you will not be able to recover this!",
        style: kMedium1BlackTextStyle(),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWellIconButton(
              isIconRight: true,
              title: 'Cancel',
              hOuterPadding: 0,
              bgColor: kGreyColor5,
              borderRadius: 4,
              vInnerPadding: 2,
              iconData: null,
              onTap: () => Navigator.pop(context),
            ),
            kSizedBox(width: 2),
            InkWellIconButton(
              isIconRight: true,
              title: okayButtonTitle ?? 'Delete',
              hOuterPadding: 0,
              hInnerPadding: 2,
              borderRadius: 4,
              bgColor: okayButtonColor ?? kRedColor2,
              vInnerPadding: 2,
              iconData: null,
              onTap: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        )
      ],
    );
  }
}

// class ShowUploadPresDialog extends StatelessWidget {
//   final TextEditingController note;
//   final String? okayButtonTitle;
//   final Color? okayButtonColor;
//   final widget;
//
//   const ShowUploadPresDialog({super.key, required this.note, this.okayButtonTitle, this.okayButtonColor, this.widget});
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(
//         "Upload Prescription",
//         style: kBold3BlackTextStyle(),
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomAdminTextField(
//             labelText: 'Enter Note',
//             controller: note,
//           ),
//           kSizedBox(height: 2),
//           CustomLabelForTextField(
//             title: "Upload Prescription",
//             isMandatory: true,
//             borderRadius: 15,
//             labelPadding: kEdgeInsetsAll(2),
//           ),
//           kSizedBox(height: 2),
//           widget,
//         ],
//       ),
//       actions: [
//         InkWellIconButton(
//           isIconRight: true,
//           title: okayButtonTitle ?? 'Save',
//           hOuterPadding: 0,
//           hInnerPadding: 2,
//           borderRadius: 4,
//           bgColor: okayButtonColor ?? kPrimaryColor,
//           vInnerPadding: 2,
//           iconData: null,
//           onTap: () {
//             Navigator.pop(context, true);
//           },
//         )
//       ],
//     );
//   }
// }

// Future<dynamic> showPreDialog(context, {note, okayButtonTitle, okayButtonColor, widget}) async {
//   return await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return ShowUploadPresDialog(
//           note: note,
//           widget: widget,
//           okayButtonTitle: okayButtonTitle,
//           okayButtonColor: okayButtonColor,
//         );
//       });
// }

Future<dynamic> showDeleteDialog(context, {message, okayButtonTitle, okayButtonColor}) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowDeleteAlertDialog(
          message: message,
          okayButtonTitle: okayButtonTitle,
          okayButtonColor: okayButtonColor,
        );
      });
}

class CustomAlertMessageDialog extends StatelessWidget {
  final String? headTitle;

  const CustomAlertMessageDialog({super.key, this.headTitle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(headTitle ?? "Oops! You cannot delete selected data!!", style: kBold3BlackTextStyle()),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWellIconButton(
              title: ' Okay ',
              hOuterPadding: 0,
              borderRadius: 4,
              vInnerPadding: 2,
              iconData: null,
              onTap: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        )
      ],
    );
  }
}

class CustomOnlineExamMessageDialog extends StatelessWidget {
  final String? headTitle;

  const CustomOnlineExamMessageDialog({super.key, this.headTitle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(headTitle ?? "Oops! You cannot delete selected data!!", style: kBold3BlackTextStyle()),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWellIconButton(
              title: ' Okay ',
              hOuterPadding: 0,
              borderRadius: 4,
              vInnerPadding: 2,
              iconData: null,
              onTap: () {
                // kNavigatorPushNamedRemoveUntil(context, AppRoutes.onlineExamPage);
                Navigator.pop(context, true);
              },
            ),
          ],
        )
      ],
    );
  }
}

class CustomPopUpDialog extends StatelessWidget {
  final Widget textField;

  const CustomPopUpDialog({super.key, required this.textField});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Cancel Due", style: kBold3BlackTextStyle()),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textField,
            Row(
              children: [
                Expanded(child: kSizedBox()),
                InkWellIconButton(
                  title: 'Submit',
                  hOuterPadding: 0,
                  borderRadius: 4,
                  vInnerPadding: 2,
                  iconData: null,
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

showAlertMessageDialog(context, {String? headTitle}) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertMessageDialog(headTitle: headTitle);
      });
}

showOnlineExamMessageDialog(context, {String? headTitle}) async {
  return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CustomOnlineExamMessageDialog(headTitle: headTitle);
      });
}

showPopUpDialog(context, textField) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomPopUpDialog(textField: textField);
      });
}
