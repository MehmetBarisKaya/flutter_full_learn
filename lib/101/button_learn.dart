import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    IconSizes iconSizes = IconSizes();
    IconColors iconColors = IconColors();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Learn"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.red;
            })),
            child: Text("Save", style: Theme.of(context).textTheme.labelLarge),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("data"),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message_outlined,
                color: iconColors.froly,
                size: iconSizes.smallIcon,
              ))
        ],
      ),
    );
  }
}

class IconSizes {
  final double smallIcon = 40;
  static double mediumIcon = 80;
}

class IconColors {
  final Color froly = const Color(0xffED617A);
}
