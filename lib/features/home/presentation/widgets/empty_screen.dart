import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/constants/images.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Images.addTask,
          height: 227.h,
          width: 227.w,
          ),
          SizedBox(height: 25.h,),
          Text(AppStrings.whatDoYouWantToDoToday, style: styles.lato20w400,),
          SizedBox(height: 15.h,),
          Text(AppStrings.addTasks, style: styles.lato16w400,)

      ],
    );
  }
}