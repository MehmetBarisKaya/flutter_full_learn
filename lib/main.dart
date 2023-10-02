import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter101/303/lottie/lottie_learn.dart';
import 'package:flutter101/demos/provider_demo_app/feauture/tabbar/app_tabbar.dart';
import 'package:flutter101/product/constant/project_constant.dart';
import 'package:flutter101/product/global/theme_notifier.dart';
import 'package:flutter101/product/init/product_init.dart';
import 'package:flutter101/product/navigator/navigator_custom.dart';
import 'package:provider/provider.dart';
import 'product/navigator/navigator_manager.dart';

Future<void> main() async {
  final productInit = ProductInit();
  await productInit.init();
  runApp(
    EasyLocalization(
        supportedLocales: productInit.localizationInit.supportedLocales,
        path: productInit.localizationInit.localizationPath,
        fallbackLocale: const Locale('en', 'US'),
        child: MultiProvider(
          providers: productInit.providers,
          builder: (context, child) => const MyApp(),
        )),
  );
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1,
          ),
          child: child ?? const SizedBox()),
      //initialRoute: "/",
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const LottieLearn(),
      ),
      //routes: NavigatorRoutes().items,
      onGenerateRoute: onGenerateRoute,
      navigatorKey: NavigatorManager.instance.navigatorGlobalKey,
      home: const AppTabBar(),
    );
  }
}
