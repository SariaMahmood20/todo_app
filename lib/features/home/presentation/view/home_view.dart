import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/features/home/presentation/widgets/empty_screen.dart';
import 'package:todo_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:todo_app/features/home/presentation/widgets/task_card.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch tasks only once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchTasks();
    });

    // Add a listener to the search controller
    searchController.addListener(() {
      final taskProvider = Provider.of<HomeViewModel>(context, listen: false);
      if (searchController.text.isEmpty) {
        taskProvider.clearFilter(); // Show all tasks
      } else {
        taskProvider.filterTasks(searchController.text); // Filter tasks
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Consumer<HomeViewModel>(
        builder: (context, taskProvider, child) {
          if (taskProvider.tasks.isEmpty) {
            return const EmptyScreen();
          } else {
            return Column(
              children: [
                SizedBox(height: 20.h),
                TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: AppStrings.searcgForYourTasks,
                    hintStyle: styles.lato16w600.copyWith(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: styles.neutralColor,
                        width: 1.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search, color: styles.neutralColor),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchController.text.isEmpty
                        ? taskProvider.tasks.length
                        : taskProvider.filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = searchController.text.isEmpty
                          ? taskProvider.tasks[index]
                          : taskProvider.filteredTasks[index];
                      final tasks = taskProvider.tasks;
                      return Column(
                        children: [
                          TaskCard(
                            task: task,
                            onPressed: () {
                              taskProvider.deleteTask(index, context);
                            },
                            checkedFunction: (task){taskProvider.updateTask(title: task.title, description: task.description, category: task.category, priority: task.priority, time: task.time, context: context, isDone: !task.isDone);},
                            // checkedFunction: (bool? value) {
                            //   taskProvider.updateTask(
                            //     taskId: task.id,
                            //     title: task.title,
                            //     description: task.description,
                            //     category: task.category,
                            //     priority: task.priority,
                            //     time: task.time,
                            //     context: context,
                            //     isDone: value ?? false,
                            //   );
                            // },
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
