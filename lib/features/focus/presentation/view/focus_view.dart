import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:todo_app/features/focus/presentation/widgets/timer_widget.dart';
import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/views/widgets/button.dart';
import 'package:todo_app/features/focus/presentation/view_model/focus_view_model.dart';


class FocusView extends StatelessWidget {
  final CountDownController controller = CountDownController();
  FocusView({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Consumer<FocusViewModel>(
      builder: (context, focusProvider, child){
        return Column(
        children: [
          SizedBox(height: 50.h,),
          TimerWidget(controller: controller,),
          SizedBox(height: 30.h,),
          SizedBox(
            width: 300.w,
            child: Text(AppStrings.focusMessage, style: styles.lato16w400, textAlign: TextAlign.center,),
          ),
          SizedBox(height: 40.h,),
          Button(width: 150.w, buttonText: AppStrings.startFocusing, onPressed: (){focusProvider.addFocus(DateTime.friday as DateTime, DateTime.now().minute as DateTime);})
          ],
      );
      },
    );
  }
}