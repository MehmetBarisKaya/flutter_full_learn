import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter101/product/init/lang/locale_keys.g.dart';
import 'package:uikit/uikit.dart';

class ComputeLearnView extends StatefulWidget {
  const ComputeLearnView({Key? key}) : super(key: key);
  @override
  State<ComputeLearnView> createState() => _ComputeLearnViewState();
}

class _ComputeLearnViewState extends State<ComputeLearnView> {
  int _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_result.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await compute(Calculator.sum, 1000000);
          setState(() {
            _result = result;
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const CircularProgressIndicator(),
          Text(LocaleKeys.button_send.tr()),
          const LoadingLottie(),
        ],
      ),
    );
  }
}

class Calculator {
  static int sum(int limit) {
    int result = 0;
    for (var i = 0; i < limit; i++) {
      result = i * i;
    }
    return result;
  }
}
