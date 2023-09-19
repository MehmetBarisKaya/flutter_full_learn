import 'package:flutter/material.dart';
import 'package:flutter101/303/lottie/lottie_learn.dart';
import 'package:flutter101/product/constant/project_constant.dart';
import 'package:flutter101/product/global/resource_context.dart';
import 'package:flutter101/product/global/theme_notifier.dart';
import 'package:flutter101/product/navigator/navigator_custom.dart';
import 'package:provider/provider.dart';
import '303/package/kartal_view.dart';
import 'product/navigator/navigator_manager.dart';

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

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ProjectConstants.projectName,
      theme: context.watch<ThemeNotifer>().currentTheme,
      debugShowCheckedModeBanner: false,
      //initialRoute: "/",
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const LottieLearn(),
      ),
      //routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      home: const KartalView(),
    );
  }
}
