import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter101/303/mobx_image_picker/modal/image_upload_response.dart';
import 'package:flutter101/303/mobx_image_picker/service/image_upload_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'image_upload_view_modal.g.dart';

class ImageUploadViewModal = _ImageUploadViewModalBase with _$ImageUploadViewModal;

abstract class _ImageUploadViewModalBase with Store {
  static const _baseUrl = "https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/";

  @observable
  String imageUrl = "";

  @observable
  File? file;

  @observable
  bool isLoading = false;

  @observable
  String downloadText = "";

//
  ImageUploadService imageUploadService = ImageUploadService(Dio(BaseOptions(baseUrl: _baseUrl)));

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void updateDownloadText(int sent, int total) {
    downloadText = "$sent / $total";
  }

  @action
  void uploadImageUrl(ImageUploadResponse? response) {
    if (response == null) {
      return;
    }
    imageUrl =
        "https://firebasestorage.googleapis.com/v0/b/fluttertr-ead5c.appspot.com/o/${response.name?.replaceFirst("/", "%2F") ?? ""}";
  }

  void init(params) {}

  @action
  void saveLocalFile(XFile? file) {
    if (file == null) return;
    this.file = File(file.path);
  }

  Future<void> saveDataToservice(String name) async {
    if (file == null) return;
    changeLoading();
    final response = await imageUploadService.uploadToImageServer(
      await file!.readAsBytes(),
      name,
      onSendProgress: (sent, total) {
        updateDownloadText(sent, total);
      },
    );
    uploadImageUrl(response);
  }
}
