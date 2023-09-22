import 'package:flutter/material.dart';

class LocalizationInit {
  final List<Locale> supportedLocales = const [
    Locale('en', 'US'),
    Locale('de', 'DE')
  ];
  final String localizationPath = "assets/translations";
}
