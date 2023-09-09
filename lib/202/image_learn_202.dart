import 'package:flutter/material.dart';
import 'package:flutter101/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ResourceContext>().clear();
        },
        child: const Icon(Icons.remove),
      ),
      appBar: AppBar(
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ""),
      ),
      body: Center(child: ImagePaths.ic_apple_with_book.toWidget(height: 100)),
    );
  }
}

// ignore: constant_identifier_names
enum ImagePaths { ic_apple_with_book }

extension ImagePathsExtension on ImagePaths {
  String path() {
    return "assets/png/$name.png";
  }

  Widget toWidget({double height = 24}) {
    return Image.asset(
      path(),
      height: height,
    );
  }

  void value() {
    switch (this) {
      case ImagePaths.ic_apple_with_book:
        // TODO: Handle this case.
        break;
    }
  }
}
