import 'package:flutter/material.dart';
import 'package:flutter101/202/theme/dark_theme.dart';
import 'package:flutter101/202/theme/light_theme.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme =>
      isLightTheme ? LightTheme().theme : DarkTheme().theme;
}
