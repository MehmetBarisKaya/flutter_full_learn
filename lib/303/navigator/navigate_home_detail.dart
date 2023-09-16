import 'package:flutter/material.dart';

class NavigateHomeDetail extends StatefulWidget {
  NavigateHomeDetail({super.key, this.id});
  String? id;

  @override
  State<NavigateHomeDetail> createState() => _NavigateHomeDetailState();
}

class _NavigateHomeDetailState extends State<NavigateHomeDetail> {
  String? _id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id = widget.id;
    if (_id == null) {
      Future.microtask(() {
        final modelId = ModalRoute.of(context)?.settings.arguments;

        setState(() {
          _id = modelId is String ? modelId : widget.id;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_id ?? "")),
    );
  }
}
