import 'package:flutter/material.dart';
import 'package:flutter101/product/constant/lottie_items.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../product/constant/duration_constant.dart';
import '../../product/global/theme_notifier.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: DurationConstant.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Lottie.asset(LottieItems.themeChange.lottiePath, repeat: false, controller: controller),
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

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });
  final _loadingLottie = "https://lottie.host/daf748d9-f9c8-4c70-baa7-04b09b141d32/YI32mn9JrB.json";

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}
