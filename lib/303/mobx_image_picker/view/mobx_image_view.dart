import 'package:flutter/material.dart';
import 'package:flutter101/303/mobx_image_picker/viewModal/image_upload_view_modal.dart';
import 'package:flutter101/product/utility/image_upload.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class MobxImageUploadView extends StatefulWidget {
  const MobxImageUploadView({super.key});

  @override
  State<MobxImageUploadView> createState() => _MobxImageUploadViewState();
}

class _MobxImageUploadViewState extends State<MobxImageUploadView> {
  final String _imageUploadLottiePath = "https://lottie.host/dd324917-9c9b-4c2e-96f0-c727fd0777e0/enM8Vafqxb.json";

  final _imageUploadViewModal = ImageUploadViewModal();
  final _imageUploadManager = ImageUploadManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _imageUploadViewModal.saveDataToservice("bk");
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Image Upload"),
        actions: [
          Observer(
            builder: (_) {
              return _imageUploadViewModal.isLoading ? const CircularProgressIndicator() : const SizedBox();
            },
          ),
          Observer(builder: (_) {
            return Text(_imageUploadViewModal.downloadText);
          })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Card(
              elevation: 10,
              child: Row(
                children: [
                  Expanded(
                    child: _localImage(),
                  ),
                  Expanded(
                    child: _imageUploadButton(),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Expanded(
            flex: 4,
            child: _imageNetwork(),
          )
        ],
      ),
    );
  }

  Observer _localImage() {
    return Observer(
      builder: (context) {
        return _imageUploadViewModal.file != null ? Image.file(_imageUploadViewModal.file!) : const SizedBox();
      },
    );
  }

  FittedBox _imageUploadButton() {
    return FittedBox(
        child: IconButton(
            onPressed: () async {
              _imageUploadViewModal.saveLocalFile(await _imageUploadManager.fetchFromLibrary());
            },
            icon: Lottie.network(_imageUploadLottiePath)));
  }

  Observer _imageNetwork() {
    return Observer(builder: (_) {
      return _imageUploadViewModal.imageUrl.isNotEmpty
          ? Image.network(_imageUploadViewModal.imageUrl)
          : const SizedBox();
    });
  }
}
