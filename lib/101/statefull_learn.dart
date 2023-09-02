import 'package:flutter/material.dart';
import 'package:flutter101/product/counter_hello_button.dart';
import 'package:flutter101/product/language/language_items.dart';

class StatfullLearn extends StatefulWidget {
  const StatfullLearn({super.key});

  @override
  State<StatfullLearn> createState() => _StatfullLearnState();
}

class _StatfullLearnState extends State<StatfullLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItmes.welcomeTitle),
      ),
      body: Column(
        children: const [Center(child: CounterHelloButton())],
      ),
    );
  }
}
