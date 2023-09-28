// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter101/303/mobx_learn/core/widget/task_card.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter101/303/mobx_learn/feature/task/viewmodel/task_view_model.dart';

class TaskViewView extends StatefulWidget {
  const TaskViewView({Key? key}) : super(key: key);
  @override
  State<TaskViewView> createState() => _TaskViewViewState();
}

final TaskViewModel _viewModel = TaskViewModel();

class _TaskViewViewState extends State<TaskViewView> {
  @override
  Widget build(BuildContext context) {
    if (_viewModel.contextt == null) {
      _viewModel.setContext(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: buildObserverTitle(),
      ),
      body: buildObserverBody(),
    );
  }

  Observer buildObserverTitle() {
    return Observer(builder: (_) {
      return Visibility(
        visible: _viewModel.pageLifes == LifeState.LOADING,
        child: const CircularProgressIndicator(),
      );
    });
  }

  Observer buildObserverBody() {
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: _viewModel.items.length,
        itemBuilder: (context, index) => Card(
          child: TaskCard(taskModel: _viewModel.items[index]),
        ),
      );
    });
  }
}

extension ListViewExtension on ListView {
  // It will notify to each paging load
  // You should control the state for your widget
  Widget onLazyLoads(Future<void> Function() onPagingLoad,
      {Widget? itemLoadWidget}) {
    if (childrenDelegate is SliverChildListDelegate) {
      throw Exception('You should use list view builder ');
    }
    final delegate = childrenDelegate as SliverChildBuilderDelegate;
    final itemCount = delegate.childCount ?? 0;
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.pixels ==
            notification.metrics.maxScrollExtent) {
          onPagingLoad();
        }
        return true;
      },
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final childBuilder =
              delegate.builder(context, index) ?? const SizedBox.shrink();
          if (index == itemCount - 1) {
            return Column(
              children: [
                childBuilder,
                itemLoadWidget ??
                    const Center(child: CircularProgressIndicator())
              ],
            );
          }
          return childBuilder;
        },
      ),
    );
  }
}
