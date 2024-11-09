import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/view_models/date_provider.dart';

import 'package:todo_app/features/auth/presentation/widgets/finger_print_auth.dart';
import 'package:todo_app/features/home/presentation/widgets/add_task.dart';

class UtilsFunctions{
  static fingerprintAuthentication(BuildContext context){
    showModalBottomSheet(
      context: context, 
      sheetAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
      useSafeArea: true,
      constraints: BoxConstraints(maxHeight: 400.h, minHeight: 400.h),
      builder: (context) {
        return const FingerPrintAuth();
      },
    );
  }

  static addTask(BuildContext context){
    showModalBottomSheet(
      context: context, 
      useSafeArea: true,
      sheetAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
      builder: (context){
        return ChangeNotifierProvider(
          create: (context)=>DateProvider(),
          child: AddTask()
          );
      }
      );
  }

  
}