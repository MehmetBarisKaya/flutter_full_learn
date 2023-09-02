import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  const ColorDemosView({super.key, required this.initialColor});
  final Color? initialColor;

  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {
  Color? _backgroundColor;

  void changeBackground(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _backgroundColor && _backgroundColor != null) {
      changeBackground(widget.initialColor!);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _backgroundColor = widget.initialColor ?? Colors.transparent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: const [
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.red,
            ),
            label: "Red"),
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.green,
            ),
            label: "Green"),
        BottomNavigationBarItem(
            icon: _ColorContainer(
              color: Colors.blue,
            ),
            label: "Blue"),
      ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackground(Colors.red);
    } else if (value == _MyColors.green.index) {
      changeBackground(Colors.green);
    } else if (value == _MyColors.blue.index) {
      changeBackground(Colors.blue);
    }
  }
}

enum _MyColors { red, green, blue }

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({super.key, required this.color});

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 10,
      height: 10,
    );
  }
}
