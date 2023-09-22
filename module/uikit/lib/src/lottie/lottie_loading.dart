import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({
    super.key,
  });
  final _loadingLottie =
      "https://lottie.host/daf748d9-f9c8-4c70-baa7-04b09b141d32/YI32mn9JrB.json";

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(_loadingLottie));
  }
}
