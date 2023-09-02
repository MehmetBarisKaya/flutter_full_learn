import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Lifecycle extends StatefulWidget {
  const Lifecycle({super.key, required this.message});
  final String message;
  @override
  State<Lifecycle> createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle> {
  String _message = "";
  late final bool _isOdd;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
    super.initState();
  }

  _computeName() {
    if (_isOdd) {
      _message += "Cift";
    } else {
      _message += "Tek";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
