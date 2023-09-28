import 'package:flutter/material.dart';
import 'package:flutter101/303/mobx_learn/feature/task/model/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  const TaskCard({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Scaffold(
                appBar: AppBar(),
                body: Image.network(taskModel.imageUrl!),
              ),
            )),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(taskModel.imageUrl!),
        ),
        title: Text(taskModel.description ?? ""));
  }
}
