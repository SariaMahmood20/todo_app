import 'package:flutter/material.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(task.title), Text(task.description), Text(task.category), Text(task.priority), Text(task.time)
      ],
    );
  }
}