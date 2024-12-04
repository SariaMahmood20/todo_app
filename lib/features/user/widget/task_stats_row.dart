import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';

class TaskStatsRow extends StatelessWidget {
  final int completedTasks;
  final int unCompletedTasks;
  const TaskStatsRow({super.key, required this.completedTasks, required this.unCompletedTasks});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 50.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Text(
              "${unCompletedTasks} Tasks Left",
              style: styles.lato16w700,
            ),
          ),
        ),
        Container(
          height: 40.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(
            child: Text(
              "${completedTasks} Tasks Done",
              style: styles.lato16w700,
            ),
          ),
        )
      ],
    );
  }
}