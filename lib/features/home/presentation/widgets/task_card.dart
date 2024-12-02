import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/app/resources/app_theme.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return SizedBox(
      height: 300.h,
      width: 300.w,
      child: Column(
        children: [
          Text(task.title, style: styles.lato14w600,), Text(task.description), Text(task.category), Text(task.priority), Text(task.time)
        ],
      ),
    );
  }
}