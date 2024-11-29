import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/constants/svg_icons.dart';
import 'package:todo_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:todo_app/features/home/presentation/widgets/add_task_fields.dart';
import 'package:todo_app/app/view_models/date_provider.dart';

class AddTask extends StatelessWidget {

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.h),
      child: Column(
        children: [
          Text(AppStrings.addTask, style: styles.lato20w600,),
          SizedBox(height: 15.h,),
          AddTaskFields(controller: titleController, hintText: AppStrings.title),
          SizedBox(height: 15.h,),
          AddTaskFields(controller: descriptionController, hintText: AppStrings.description),
          SizedBox(height: 25.h),
          ChangeNotifierProvider(
            create: (context)=> DateProvider(),
            child: Consumer<DateProvider>(
              builder: (context, provider, child){
                return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 136.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){provider.pickDate(context);}, icon: SvgPicture.asset(SvgIcons.timer)),
                        IconButton(onPressed: (){provider.categoryTag(context);}, icon: SvgPicture.asset(SvgIcons.categoryTag)),
                        IconButton(onPressed: (){provider.priorityTag(context);}, icon: SvgPicture.asset(SvgIcons.priorityFlag))
                      ],
                      
                    ),
                  ),
                  Consumer<HomeViewModel>(
                    builder: (context, taskProvider, child){
                      return IconButton(onPressed: (){
                        taskProvider.addTask(title:  titleController.text, description: descriptionController.text, category: provider.category, priority: provider.priority, time: provider.finalDate, context: context);
                        GoRouter.of(context).pop();
                      }, icon: SvgPicture.asset(SvgIcons.sendTask));
                    },
                  )
              
                ],
              );
              },
            ),
          )
          
        ],
      ),
      );
  }
}