import 'package:flutter/material.dart';
import 'package:flutter101/303/mobx_learn/core/network/network_manager.dart';
import 'package:flutter101/303/mobx_learn/feature/task/model/task_model.dart';
import 'package:flutter101/303/mobx_learn/feature/task/service/task_service.dart';
import 'package:mobx/mobx.dart';
part 'task_view_model.g.dart';

class TaskViewModel = _TaskViewModelBase with _$TaskViewModel;

abstract class _TaskViewModelBase with Store {
  BuildContext? contextt;
  late ITaskService taskService;
  @observable
  List<TaskModel> items = [];

  @observable
  LifeState pageLifes = LifeState.IDDLE;

  _TaskViewModelBase() {
    taskService = TaskService(TaskNetworkManager.instance.dio);
  }

  void setContext(BuildContext? context) {
    contextt = context;
    fetchItems();
  }

  @action
  Future<void> fetchItems() async {
    pageLifes = LifeState.LOADING;
    items = await taskService.fetchAllTask();
    pageLifes = LifeState.DONE;
  }
}

enum LifeState {
  IDDLE,
  LOADING,
  DONE,
}

// @computed
  // bool get isOdd => counter.isOdd;

  // @observable
  // int counter = 0;

  // @action
  // void onIncrementCount() {
  //   counter += 1;
  // }