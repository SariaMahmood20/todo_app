import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/features/home/presentation/widgets/empty_screen.dart';
import 'package:todo_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card.dart';

class HomeView extends StatelessWidget {
  final searchController = TextEditingController();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Consumer<HomeViewModel>(
      builder: (context, taskProvider, child){
        if(taskProvider.tasks.isEmpty){
          return const EmptyScreen();
        }else{
          return Column(
            children: [
              SizedBox(height: 20.h,),
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: AppStrings.searcgForYourTasks,
                  hintStyle: styles.lato16w600.copyWith(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: styles.neutralColor, width: double.infinity)
                  ),
                  prefixIcon: Icon(Icons.search, color: styles.neutralColor,)
                ),  
              ),
              ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index){
                  if(searchController.text.isEmpty){
                    return TaskCard(task: taskProvider.tasks[index]);
                  }else{
                    taskProvider.filterTasks(searchController.text);
                    return TaskCard(task: taskProvider.filteredTasks[index]);
                  }
                  
                }
                )
                
              ],
          );
        }
      },
    );
  }
}