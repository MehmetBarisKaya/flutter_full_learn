import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter101/101/custom_widget_learn.dart';
import 'package:flutter101/101/indicator_learn.dart';
import 'package:flutter101/101/navigation_learn.dart';
import 'package:flutter101/101/padding_learn.dart';
import 'package:flutter101/101/page_view_learn.dart';
import 'package:flutter101/101/statefull_learn.dart';
import 'package:flutter101/101/statfeull_life_cycle.dart';
import 'package:flutter101/demos/color_demos_view.dart';
import 'package:flutter101/demos/color_life_cycle_view.dart';

import '101/button_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.red),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              elevation: 0,
            )),
        debugShowCheckedModeBanner: false,
        home: NavigationLearn());
  }
}
