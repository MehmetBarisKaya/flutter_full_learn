import 'dart:developer';

import 'package:flutter/material.dart';

class AlertLearn extends StatefulWidget {
  const AlertLearn({super.key});

  @override
  State<AlertLearn> createState() => _AlertLearnState();
}

class _AlertLearnState extends State<AlertLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const _ImageDialog();
            },
          );
          if (result is bool && result == true) {
            inspect(result);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _UpdateDialog extends StatelessWidget {
  const _UpdateDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Version"),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Upgrade"))
      ],
    );
  }
}

class UpdateDialog extends AlertDialog {
  UpdateDialog({Key? key, required BuildContext context})
      : super(
          key: key,
          title: const Text("Version"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Upgrade"))
          ],
        );
}

class _ImageDialog extends StatelessWidget {
  const _ImageDialog();
  final String _url = "https://picsum.photos/200";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: Image.network(
          _url,
          fit: BoxFit.cover,
          height: 400,
        ),
      ),
    );
  }
}
