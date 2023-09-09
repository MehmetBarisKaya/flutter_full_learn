import 'package:flutter/material.dart';

import '../../303/call_back_learn.dart';

class CallBackDrowDown extends StatefulWidget {
  const CallBackDrowDown({super.key, required this.onUserSelected});

  final void Function(CallBackUser user) onUserSelected;

  @override
  State<CallBackDrowDown> createState() => _CallBackDrowDownState();
}

class _CallBackDrowDownState extends State<CallBackDrowDown> {
  CallBackUser? _callBackUser;
  void _updateUser(CallBackUser? callBackUser) {
    setState(() {
      _callBackUser = callBackUser;
    });
    if (_callBackUser != null) {
      widget.onUserSelected.call(_callBackUser!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
        value: _callBackUser,
        items: CallBackUser.dummyUsers()
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ))
            .toList(),
        onChanged: _updateUser);
  }
}
