import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/app/resources/app_theme.dart';

class MyAppbar extends StatelessWidget implements PreferredSize{
  final String appbarTitle;
  const MyAppbar({super.key, required this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return AppBar(
      title: Text(appbarTitle, style: styles.lato20w600,),
      centerTitle: true,
    );
  }
  
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
  
  @override
  Size get preferredSize => Size.fromHeight(56.h);
  
}