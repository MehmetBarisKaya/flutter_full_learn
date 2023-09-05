import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> {
  bool _isVisible = false;
  bool _isOpacity = false;
  void _changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Text("data", style: context.textTheme().displayLarge)
    return Scaffold(
      appBar: AppBar(
        title: _animatedPlaceHolder(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisibility();
        },
      ),
      body: Column(
        children: [
          ListTile(
            title: AnimatedOpacity(
                duration: _Duration.lowDuration, opacity: _isOpacity ? 1 : 0, child: const Text("dawta")),
            trailing: IconButton(onPressed: _changeOpacity, icon: const Icon(Icons.ac_unit)),
          )
        ],
      ),
    );
  }

  AnimatedCrossFade _animatedPlaceHolder() {
    return AnimatedCrossFade(
        firstChild: const Placeholder(),
        secondChild: const SizedBox.shrink(),
        crossFadeState: _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _Duration.lowDuration);
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _Duration {
  static const lowDuration = Duration(seconds: 1);
}
