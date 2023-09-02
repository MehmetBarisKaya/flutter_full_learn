import 'package:flutter/material.dart';
import 'package:flutter101/product/language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterValue = 0;
  final String _welcometitle = LanguageItmes.welcomeTitle;

  void _updateCounter() {
    setState(() {
      ++_counterValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _updateCounter, child: Text("$_welcometitle $_counterValue"));
  }
}
