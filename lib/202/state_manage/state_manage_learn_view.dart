import 'package:flutter/material.dart';
import 'package:flutter101/202/state_manage/state_manage_view_model.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

// burada oluşturduğum modelı extend ederek StateLearnViewModel classımın tüm özelliklerini import ettim
class _StateManageLearnViewState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeOpacity();
        },
      ),
      appBar: AppBar(
        backgroundColor: isOpacity ? Colors.red : Colors.green,
      ),
      body: const Placeholder(),
    );
  }
}
