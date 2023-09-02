import 'package:flutter/material.dart';
import 'package:flutter101/core/random_image.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CenteredProgressIndicator()],
      ),
      body: Column(
        children: const [
          LinearProgressIndicator(),
          SizedBox(
            height: 50,
          ),
          RandomImage()
        ],
      ),
    );
  }
}

class CenteredProgressIndicator extends StatelessWidget {
  const CenteredProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
