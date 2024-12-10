import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:todo_app/features/focus/presentation/widgets/timer_widget.dart';
import 'package:todo_app/features/focus/presentation/widgets/focus_graph.dart';
import 'package:todo_app/features/focus/presentation/view_model/focus_view_model.dart';


class FocusView extends StatelessWidget {
  final CountDownController controller = CountDownController();
  FocusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FocusViewModel>(
      builder: (context, focusProvider, child) {
        if (focusProvider.focuses.isEmpty) {
          focusProvider.fetchFocuses();
        }
        return Padding(
          padding: EdgeInsets.all(8.0),  // Optional, just to add some spacing
          child: Column(
            children: [
              TimerWidget(),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: focusProvider.focuses.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 15.h),
                        FocusCard(
                          day: focusProvider.focuses[index].day,
                          minutes: focusProvider.focuses[index].time,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
