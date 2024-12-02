import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    DateTime now = DateTime.now();
    return CircularCountDownTimer(
      width: 213.w, 
      height: 213.h, 
      duration: 2, 
      fillColor: styles.neutralColor, 
      ringColor: Colors.white24,
      isTimerTextShown: true,
      strokeWidth: 12.h,
      );
  }
}

