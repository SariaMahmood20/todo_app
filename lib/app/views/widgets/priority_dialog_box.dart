import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:todo_app/app/constants/svg_icons.dart';
import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';

class PriorityDialogBox extends StatelessWidget {
  const PriorityDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.editTaskPriority, style: styles.lato16w700,),
          SizedBox(height: 7.h,),
          const Divider()
        ],
      ),
      content: SizedBox(height: 400.h, width: 300.w,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,), 
          itemCount: 10,
          itemBuilder: (context, index){
            return InkWell(
            onTap: ()=> GoRouter.of(context).pop(index.toString()),
            child: Container(
              height: 35.h,
              width: 35.w,
              margin: EdgeInsets.all(5.h),
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5.h,),
                  SvgPicture.asset(SvgIcons.priorityFlag, color: Colors.white, height: 20.h, width: 20.w,),
                  SizedBox(height: 7.h,),
                  Text(index.toString(), style: styles.lato16w400,),
                  SizedBox(height: 5.h,)
                ],
              ),
            ),
          );
          }
          ),
      ),
    );
  }
}