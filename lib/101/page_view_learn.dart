import 'package:flutter/material.dart';
import 'package:flutter101/101/indicator_learn.dart';
import 'package:flutter101/101/padding_learn.dart';
import 'package:flutter101/101/statefull_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final PageController _controller = PageController();

  int _curentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _curentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_curentPageIndex.toString()),
          FloatingActionButton(
              onPressed: () {
                _controller.previousPage(duration: const Duration(milliseconds: 1), curve: Curves.bounceIn);
              },
              child: const Icon(Icons.chevron_left)),
          FloatingActionButton(
              onPressed: () {
                _controller.nextPage(duration: const Duration(milliseconds: 1), curve: Curves.bounceIn);
              },
              child: const Icon(Icons.chevron_right)),
        ],
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: _updatePageIndex,
        children: const [PaddingLearn(), IndicatorLearn(), StatfullLearn()],
      ),
    );
  }
}
