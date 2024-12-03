import 'package:flutter/material.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';
import 'package:to_do_app/features/task/presentation/widgets/task_component.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.taskModel});
  final List<TaskModel> taskModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskModel.length,
          itemBuilder: (context, index) {
            return TaskComponent(
              index: index,
              taskModel: taskModel[index],
            );
          }),
    );
  }
}
