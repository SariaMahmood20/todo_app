import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/features/auth/presentation/widgets/finger_print_auth.dart';

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
}