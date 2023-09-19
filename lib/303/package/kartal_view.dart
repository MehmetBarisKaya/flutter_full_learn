import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class KartalView extends StatefulWidget {
  const KartalView({super.key});

  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Kartal",
            style: context.general.textTheme.headlineLarge,
          ),
          AnimatedContainer(
            duration: context.duration.durationLow,
            height: context.general.isKeyBoardOpen ? 0 : context.sized.dynamicHeight(0.15),
            color: Colors.red,
          ),
          const TextField()
        ],
      ),
    );
  }
}
