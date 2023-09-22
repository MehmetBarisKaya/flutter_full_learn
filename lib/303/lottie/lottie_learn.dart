import 'package:flutter/material.dart';
import 'package:flutter101/product/constant/lottie_items.dart';
import 'package:flutter101/product/navigator/navigator_routes.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:uikit/uikit.dart';

import '../../product/constant/duration_constant.dart';
import '../../product/global/theme_notifier.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: DurationConstant.durationNormal());
    navigateToHome();
  }

  void navigateToHome() async {
    await Future.delayed(DurationConstant.durationNormal());
    Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Lottie.asset(LottieItems.themeChange.lottiePath,
                repeat: false, controller: controller),
            onTap: () async {
              await controller.animateTo(isLight ? 0.5 : 1);
              // controller.animateTo(0.5);
              isLight = !isLight;
              Future.microtask(() {
                context.read<ThemeNotifer>().changeTheme();
              });
            },
          )
        ],
      ),
      body: const LoadingLottie(),
    );
  }
}
