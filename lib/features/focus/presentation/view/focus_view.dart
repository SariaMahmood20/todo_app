import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/features/focus/presentation/widgets/timer_widget.dart';

class FocusView extends StatelessWidget {
  const FocusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h,),
        const TimerWidget()
        ],
    );
  }
}