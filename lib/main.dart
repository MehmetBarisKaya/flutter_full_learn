import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter101/202/animated_learn_view.dart';

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
            tabBarTheme: const TabBarTheme(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
            progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
            listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
            cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            textSelectionTheme: const TextSelectionThemeData(
                selectionColor: Colors.red, cursorColor: Colors.green, selectionHandleColor: Colors.black),
            inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                iconColor: Colors.red,
                labelStyle: TextStyle(color: Colors.lime),
                border: OutlineInputBorder(),
                floatingLabelStyle: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600)),
            textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.red)),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.transparent,
              elevation: 0,
            )),
        debugShowCheckedModeBanner: false,
        home: const AnimatedLearnView());
  }
}
