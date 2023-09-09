import 'package:flutter/material.dart';
import 'package:flutter101/303/reqres_resources/view/reqres_view.dart';
import 'package:flutter101/product/global/resource_context.dart';
import 'package:flutter101/product/global/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (_) => ResourceContext(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeNotifer(),
      )
    ],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeNotifer>().currentTheme,
      debugShowCheckedModeBanner: false,
      home: const ReqResView(),
    );
  }
}
