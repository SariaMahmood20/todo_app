import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/app/resources/app_theme.dart';

class TaskCard extends StatelessWidget {
  final Function(TaskModel) checkedFunction;
  final Function onPressed;
  final TaskModel task;

  const TaskCard({
    super.key,
    required this.task,
    required this.onPressed,
    required this.checkedFunction,
  });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return InkWell(
      onLongPress: () async {
        onPressed();
      },
      child: Container(
        height: 75.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task.title,
                    style: styles.lato16w700,
                  ),
                  Checkbox(
                    value: task.isDone,
                    onChanged: (bool? value) {
                      checkedFunction(task); // Pass the new value to the callback
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Category: ${task.category}",
                    style: styles.lato12w400.copyWith(fontSize: 10.sp),
                  ),
                  Text(
                    "Priority: ${task.priority}",
                    style: styles.lato12w400.copyWith(fontSize: 10.sp),
                  ),
                  Text(
                    "Deadline: ${task.time}",
                    style: styles.lato12w400.copyWith(fontSize: 10.sp),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
