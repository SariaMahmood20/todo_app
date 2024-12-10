import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:todo_app/features/auth/presentation/view_model/user_details_view_model.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/constants/svg_icons.dart';
import 'package:todo_app/features/home/presentation/view_model/home_view_model.dart';
import 'package:todo_app/features/user/view_model/account_settings_provider.dart';

import 'package:todo_app/features/user/widget/task_stats_row.dart';
import 'package:todo_app/app/navigation/route_names.dart';
import 'package:todo_app/features/user/widget/change_account_name.dart';
import 'package:todo_app/features/user/widget/change_password.dart';
import 'package:todo_app/features/user/widget/menu_item.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (context)=> AccountSettingsProvider(),
      child: Consumer<HomeViewModel>(
        builder: (context, taskProvider, child){
          final AccountSettingsProvider _accountProvider = AccountSettingsProvider();
          return Consumer<UserDetailsViewModel>(
            builder: (context, userProvider, child){
              userProvider.fetchUsername();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(userProvider.username, style: styles.lato20w600.copyWith(color: styles.white),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h,),
                      TaskStatsRow(completedTasks: taskProvider.doneTasks.length, unCompletedTasks: taskProvider.undoneTasks.length),
                      SizedBox(height: 15.h,),
                      Text(AppStrings.settings, style: styles.lato14w400.copyWith(color: Colors.grey),),
                      SizedBox(height: 10.h,),
                      MenuItem(onPressed: (){GoRouter.of(context).pushNamed(RouteNames.appSettings);}, svgPath: SvgIcons.settings, title: AppStrings.appSettings),
                      SizedBox(height: 20.h,),
                      Text(AppStrings.account, style: styles.lato14w400.copyWith(color: Colors.grey),),
                      SizedBox(height: 10.h,),
                      MenuItem(onPressed: (){_accountProvider.changeAccountName(context, ChangeAccountName());}, svgPath: SvgIcons.user, title: AppStrings.changeAccountName),
                      SizedBox(height: 15.h,),
                      MenuItem(onPressed: (){_accountProvider.changeAccountPassword(context, ChangePassword());}, svgPath: SvgIcons.changePassword, title: AppStrings.changeAccountPassword),
                      SizedBox(height: 20.h,),
                      Text(AppStrings.uptodo, style: styles.lato14w400.copyWith(color: Colors.grey),),
                      SizedBox(height: 10.h,),
                      MenuItem(onPressed: (){}, svgPath: SvgIcons.aboutUs, title: AppStrings.aboutUs),
                      SizedBox(height: 15.h,),
                      MenuItem(onPressed: (){}, svgPath: SvgIcons.faq, title: AppStrings.faq),
                      SizedBox(height: 15.h,),
                      MenuItem(onPressed: (){}, svgPath: SvgIcons.feeback, title: AppStrings.helpAndFeedback),
                      SizedBox(height: 15.h,),
                      MenuItem(onPressed: (){}, svgPath: SvgIcons.supportUs, title: AppStrings.supportUs),
                      SizedBox(height: 15.h,),
                      InkWell(
                        onTap: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(SvgIcons.logout, color: Colors.redAccent,height:24.h,width: 24.w,),
                            SizedBox(width: 10.w,),
                            Text(AppStrings.logout, style: styles.lato16w400.copyWith(color: Colors.redAccent),)
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );
            },
            );
        },
      ),
    );
  }
}