import 'package:flutter/material.dart';
import 'package:flutter101/product/utility/image_upload.dart';

import '../../product/utility/image_upload_manager.dart';

class ImageGenericPickerView extends StatefulWidget {
  const ImageGenericPickerView({super.key});

  @override
  State<ImageGenericPickerView> createState() => _ImageGenericPickerViewState();
}

class _ImageGenericPickerViewState extends State<ImageGenericPickerView> {
  final _imageUploadManager = ImageUploadManager();
  late final ImageUploadCustomManager _imageUploadCustomManager;

  @override
  void initState() {
    super.initState();
    _imageUploadCustomManager = ImageUploadCustomManager(LibraryImageUpload());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                _imageUploadCustomManager.cropWithFetch();
              },
              child: const Text("Gallery")),
          ElevatedButton(onPressed: () {}, child: const Text("Normal")),
          ElevatedButton(onPressed: () {}, child: const Text("Multiple")),
        ],
      ),
    );
  }
}
