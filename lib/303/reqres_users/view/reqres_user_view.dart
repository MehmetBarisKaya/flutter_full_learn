import 'package:flutter/material.dart';

import '../viewModel/reqres_user_view_model.dart';

class ReqResUserView extends StatefulWidget {
  const ReqResUserView({super.key});

  @override
  State<ReqResUserView> createState() => _ReqResUserViewState();
}

class _ReqResUserViewState extends ReqReqUserViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator() : null,
      ),
      body: ListView.builder(
          itemCount: users?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(child: Text(users?[index].firstName ?? " "));
          }),
    );
  }
}
