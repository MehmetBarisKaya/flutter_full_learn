// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter101/product/widget/button/answer_button.dart';
import 'package:flutter101/product/widget/button/loading_button.dart';
import 'package:flutter101/product/widget/callback_dropdown.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({super.key});

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDrowDown(
            onUserSelected: (CallBackUser callBackUser) {},
          ),
          AnswerButton(onNumber: (number) {
            return number % 3 == 1;
          }),
          LoadingButton(
              title: "Save",
              callback: () async {
                await Future.delayed(const Duration(seconds: 5));
              }),
        ],
      ),
    );
  }
}

class CallBackUser {
  final String name;
  final String id;

  CallBackUser(this.name, this.id);

//TODO dummy data
  static List<CallBackUser> dummyUsers() {
    return [
      CallBackUser("bk", "1"),
      CallBackUser("bk2", "2"),
      CallBackUser("bk3", "3"),
      CallBackUser("bk4", "4"),
    ];
  }

  @override
  bool operator ==(covariant CallBackUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
