import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/features/user/widget/menu_item.dart';
import 'package:todo_app/app/views/widgets/my_appbar.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/constants/svg_icons.dart';

class AppSettingsView extends StatelessWidget {
  const AppSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      appBar: MyAppbar(appbarTitle: AppStrings.appSettings),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),
            Text(AppStrings.settings, style: styles.lato14w400.copyWith(color: Colors.grey),),
            SizedBox(height: 10.h,),
            MenuItem(onPressed: (){}, svgPath: SvgIcons.changeColor, title: AppStrings.changeAppColor),
            SizedBox(height: 15.h,),
            MenuItem(onPressed: (){}, svgPath: SvgIcons.typography, title: AppStrings.changeAppTypography),
            SizedBox(height: 15.h,),
            MenuItem(onPressed: (){}, svgPath: SvgIcons.changeLanguage, title: AppStrings.changeAppLanguage),
            SizedBox(height: 20.h,),
            Text(AppStrings.import,style: styles.lato14w400.copyWith(color: Colors.grey),),
            SizedBox(height: 10.h),
            MenuItem(onPressed: (){}, svgPath: SvgIcons.imporCalender, title: AppStrings.importFromGoogleCalender),
          ],
        ),
      ),
    );
  }
}