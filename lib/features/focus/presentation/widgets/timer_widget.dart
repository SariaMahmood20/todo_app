import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';

class TimerWidget extends StatelessWidget {
  final CountDownController controller;
  TimerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return CircularCountDownTimer(
      width: 213.w, 
      height: 213.h, 
      duration: Duration.minutesPerDay,
      controller: controller,
      fillColor: styles.neutralColor, 
      ringColor: Colors.white24,
      isTimerTextShown: true,
      strokeWidth: 12.h,
      textStyle: styles.lato32w700.copyWith(color: styles.white, fontSize: 30.sp),
      textFormat: CountdownTextFormat.MM_SS,
      );
  }
}

