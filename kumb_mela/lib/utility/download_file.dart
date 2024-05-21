import 'dart:io';

import 'package:dio/dio.dart';
 import 'package:flutter/material.dart';
import 'package:kumb_mela/utility/show_msg_snack.dart';
 import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'add_ons.dart';

class CustomDownloadFile {
  final String? url;
  final String fileName;
  final String docTitle;
  final String docSource;
  final bool isFileExist;
  final String? fileExtension;
  final bool? isPrivate;

  CustomDownloadFile({
    required this.docTitle,
    required this.docSource,
    required this.url,
    required this.fileName,
    this.isPrivate,
    this.fileExtension,
    this.isFileExist = true,
  });

  get getDriveIdToUrl {
    if (url!.length == 33 || url!.length == 44) {
      return "https://drive.google.com/uc?id=$url&export=download";
    } else {
      return url!;
    }
  }
}

String getFileExtension(String url) {
  var data = extensions.where((element) => url.contains(element['name']));
  if (data.isNotEmpty) {
    return data.first['name'];
  } else {
    return "";
  }
}

get extensions {
  return [
    {"name": ".csv", "type": "application/vnd.ms-excel"},
    {"name": ".apk", "type": "application/vnd.android.package-archive"},
    {"name": ".docx", "type": "application/vnd.openxmlformats-officedocument.wordprocessingml.document"},
    {"name": ".doc", "type": "application/msword"},
    {"name": ".xlsx", "type": "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"},
    {"name": ".xls", "type": "application/vnd.ms-excel"},
    {"name": ".jpeg", "type": "image/jpeg"},
    {"name": ".jpg", "type": "image/jpeg"},
    {"name": ".pdf", "type": "application/pdf"},
    {"name": ".png", "type": "image/png"},
    {"name": ".ppt", "type": "application/vnd.ms-powerpoint"},
    {"name": ".pptx", "type": "application/vnd.openxmlformats-officedocument.presentationml.presentation"},
    {"name": ".txt", "type": "text/plain"},
    {"name": "", "type": "*/*"},
  ];
}

String getDateTimeEpoch(String? date) {
  String updatedAt = "";
  if (date != null) {
    try {
      var data = DateTime.parse(date).millisecondsSinceEpoch.toString();
      updatedAt = "_${data.substring(data.length > 8 ? data.length - 8 : 0, data.length)}";
    } catch (_) {}
  }
  return updatedAt;
}

bool validateUrl(String? url) {
  if (checkNull(url)) {
    if (Uri.parse(url!).isAbsolute) {
      return true;
    }
  }
  return false;
}

Future<File> getFilePathUsingName(String fileName) async {
  return File("${(await getCacheDirectory()).path}/$fileName");
}

Future<Directory> getCacheDirectory() async {
  Directory mainDir;
  if (Platform.isAndroid) {
    final directory = await getExternalCacheDirectories();
    if (directory != null && directory.isNotEmpty) {
      mainDir = directory.first;
    }
  }
  mainDir = await getTemporaryDirectory();
  return Directory("${mainDir.path}/school_parent_app").create(recursive: true);
}

Future<String> requestExternalStorageDirectory() async {
  if (Platform.isIOS) {
    return (await getTemporaryDirectory()).path;
    // return (await getApplicationDocumentsDirectory()).path;
  } else {
    final directory = await getExternalStorageDirectory();
    if (directory != null) {
      return directory.path;
    } else {
      return (await getTemporaryDirectory()).path;
    }
  }
}

class CustomImageDownload {
  final BuildContext context;

  CustomImageDownload(this.context);

  Future<void> downloadFile({required String url, String? fileName, bool isFileExist = true}) async {
    String storageDirectory = await requestExternalStorageDirectory();

    Map<Permission, PermissionStatus> statuses = await [Permission.storage].request();

    if (statuses[Permission.storage]!.isGranted) {
      String extension = getFileExtension(url);

      String name = fileName != null ? (fileName + extension) : getFileName(url);
      String filePath = '$storageDirectory/$name';

      if (name.isNotEmpty) {
        if (isFileExist && await File(filePath).exists()) {
          debugPrint('file exists');
          await openFile(path: filePath);
        } else {
          try {
            await Dio().download(url, filePath, onReceiveProgress: (received, total) {});
            await openFile(path: filePath);
            debugPrint("File is saved to download folder.");
          } on DioError catch (e) {
            ShowSnack.showToast('File not found...');
          }
        }
      } else {
        ShowSnack.showToast('File not found...');
      }
    } else {
      ShowSnack.showPermissionSnack('No permission to read and write!');
    }
  }
}

Future<void> openFile({required String path, BuildContext? context}) async {
  final _result = await OpenFilex.open(path);
  if (_result.type != ResultType.done) {
    ShowSnack.showToast(_result.message);
  }
  debugPrint("type=${_result.type}  message=${_result.message}");
}

String getFileName(String? url) {
  if (url != null) {
    try {
      String extension = getFileExtension(url);
      url = url.substring(url.lastIndexOf('/') + 1, url.lastIndexOf('.'));
      return url + extension;
    } catch (e) {
      return '';
    }
  } else {
    return '';
  }
}
