// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    Key? key,
    required this.title,
    required this.callback,
  }) : super(key: key);

  final String title;
  final Future<void> Function() callback;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  // ignore: prefer_final_fields
  bool _isLoading = false;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_isLoading) return;

        _changeLoading();
        await widget.callback.call();
        _changeLoading();
      },
      child: _isLoading ? const CircularProgressIndicator() : Text(widget.title),
    );
  }
}
