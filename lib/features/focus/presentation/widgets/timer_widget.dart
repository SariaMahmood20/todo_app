import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/views/widgets/button.dart';
import 'package:todo_app/features/focus/presentation/view_model/focus_view_model.dart';

class TimerWidget extends StatelessWidget {
  final controller = CountDownController();

  TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Consumer<FocusViewModel>(
      builder: (context, focusProvider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularCountDownTimer(
              width: 213.w,
              height: 213.h,
              duration: Duration.minutesPerDay,
              controller: controller,
              fillColor: styles.neutralColor,
              ringColor: Colors.white24,
              isTimerTextShown: true,
              strokeWidth: 12.h,
              textStyle: styles.lato32w700
                  .copyWith(color: styles.white, fontSize: 30.sp),
              textFormat: CountdownTextFormat.MM_SS,
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: 300.w,
              child: Text(
                AppStrings.focusMessage,
                style: styles.lato16w400,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Button(
              width: 150.w,
              buttonText: focusProvider.isFocusing
                  ? AppStrings.stopFocus
                  : AppStrings.startFocusing,
              onPressed: () {
                if (focusProvider.isFocusing) {
                  controller.pause(); 
                  controller.reset();
                  focusProvider.toggleFocus(); 
                } else {
                  controller.start(); 
                  focusProvider.toggleFocus(); 
                }
              },
            ),
          ],
        );
      },
    );
  }
}
