import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget with _ColorsUtil {
  CustomWidgetLearn({super.key});
  final String title = "Food";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CustomButton(title: title),
      ),
    );
  }
}

class PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8);
}

class CustomButton extends StatelessWidget with _ColorsUtil, PaddingUtility {
  CustomButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: red, shape: const StadiumBorder()),
      onPressed: () {},
      child: Padding(
        padding: normalPadding,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}

class _ColorsUtil {
  final Color red = Colors.red;
  final Color whiteColor = Colors.white;
}
