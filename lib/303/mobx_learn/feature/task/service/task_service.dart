import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter101/303/mobx_learn/feature/task/model/task_model.dart';

abstract class ITaskService {
  final Dio dio;

  ITaskService(this.dio);
  Future<List<TaskModel>> fetchAllTask();
}

class TaskService extends ITaskService {
  TaskService(super.dio);

  @override
  Future<List<TaskModel>> fetchAllTask() async {
    final response = await dio.get(ITaskServiceEndPoints.DOGS.rawValue);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => TaskModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}

enum ITaskServiceEndPoints { DOGS }

extension ITaskServiceEndPointsExtension on ITaskServiceEndPoints {
  String get rawValue {
    switch (this) {
      case ITaskServiceEndPoints.DOGS:
        return "/dogs";
    }
  }
}
