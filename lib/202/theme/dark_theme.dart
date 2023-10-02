import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  final _darkColor = _DarkColor();
  late ThemeData theme;

  DarkTheme() {
    theme = ThemeData.dark().copyWith(
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: _darkColor.bitterSweet,
        indicatorSize: TabBarIndicatorSize.label,
      ),
      bottomAppBarTheme:
          const BottomAppBarTheme(shape: CircularNotchedRectangle()),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.white),
      listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
      // cardTheme: CardTheme(
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.red,
          cursorColor: Colors.green,
          selectionHandleColor: Colors.black),
      inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          iconColor: Colors.red,
          labelStyle: TextStyle(color: Colors.lime),
          border: OutlineInputBorder(),
          floatingLabelStyle: TextStyle(
              color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600)),
      textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.red)),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

class _DarkColor {
  //final Color _textColor = const Color.fromARGB(123, 124, 124, 124);
  final Color bitterSweet = const Color(0xffFF6969);
}
