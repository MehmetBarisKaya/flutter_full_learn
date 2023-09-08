// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter101/101/page_view_learn.dart';
import 'package:flutter101/202/form_learn_view.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProjectProductSheetMixin {
  Color _bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              isScrollControlled: true,
              builder: (context) {
                return _CustomSheet(bgColor: _bgColor);
              });
          if (result is bool) {
            setState(() {
              _bgColor = Colors.amber;
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: Center(
        child: TextButton(
            onPressed: () {
              showCustomSheet(context, const FormLearnView());
            },
            child: const Text("Save")),
      ),
    );
  }
}

class _CustomSheet extends StatefulWidget {
  const _CustomSheet({
    required Color? bgColor,
  });

  @override
  State<_CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<_CustomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Divider(
                    color: Colors.black26,
                    thickness: 3,
                    indent: MediaQuery.of(context).size.width * 0.45,
                    endIndent: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close_fullscreen)))
                ],
              ),
            ),
            const Text("data"),
            Image.network("https://picsum.photos/200"),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                  Navigator.of(context).pop<bool>(true);
                },
                child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}

mixin ProjectProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
        context: context,
        backgroundColor: Colors.red,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => _CustomBaseSheet(child: Expanded(child: child)));
  }
}

class _CustomBaseSheet extends StatelessWidget {
  const _CustomBaseSheet({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const _BaseSheetHeader(), child],
        ),
      ),
    );
  }
}

class _BaseSheetHeader extends StatelessWidget {
  const _BaseSheetHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Divider(
            color: Colors.black26,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close_fullscreen)))
        ],
      ),
    );
  }
}
