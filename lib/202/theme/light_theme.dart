import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        textTheme:
            ThemeData.light().textTheme.copyWith(titleMedium: TextStyle(fontSize: 20, color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(123, 124, 124, 124);
}
