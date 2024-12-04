import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/features/home/presentation/view/home_view.dart';
import 'package:todo_app/features/home/presentation/widgets/empty_screen.dart';
import 'package:todo_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:todo_app/app/view_models/date_provider.dart';
import 'package:todo_app/features/calender/presentation/widgets/select_date_row..dart';
import 'package:todo_app/features/home/presentation/widgets/task_card.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DateProvider>(
      create: (context)=>DateProvider(),
      child: Consumer<DateProvider>(
        builder: (context, dateProvider, child){
          return SizedBox(
            height: 400.h,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectDateRow(onPressed: (){dateProvider.pickDate(context);}, date: dateProvider.finalDate,),
              Consumer<HomeViewModel>(
                builder: (context, provider, child){
                  provider.dateFilter(dateProvider.finalDate);
                  return Expanded(
                    child: ListView.builder(
                      itemCount: provider.dateFilteredTasks.length,
                      itemBuilder: (context, index){
                        final task = provider.tasks[index];
                        return TaskCard(task: provider.dateFilteredTasks[index], onPressed: (){provider.deleteTask(index, context);}, checkedFunction: (task){provider.updateTask(title: task.title, description: task.description, category: task.category, priority: task.priority, time: task.time, context: context, isDone: !task.isDone);},);
                      }
                      ),
                  );
                },
              )
            ],
                    ),
          );
        },
      ),
    );
  }
}