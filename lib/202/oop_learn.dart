import 'dart:io';

import 'package:flutter101/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(String path) async {
    await launchUrl(Uri.parse(path));
  }
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) {
      throw FileDownloadException();
    }
    return true;
  }

  @override
  void toShare(String path) {}
}

class SmsDownload extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) {
      throw FileDownloadException();
    }
    return true;
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload {
  void toShowFile(String path) async {
    await launchUrl(Uri.parse(path));
  }
}
