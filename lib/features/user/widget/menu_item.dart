import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import 'package:todo_app/app/resources/app_theme.dart';


class MenuItem extends StatelessWidget {
  final Function onPressed;
  final String svgPath;
  final String title;
  const MenuItem({super.key, required this.onPressed, required this.svgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              svgPath,
              color: Colors.white,
              height: 24.h,
              width: 24.h,
            ),
            SizedBox(width: 10.w,),
            Text(title, style: styles.lato16w400.copyWith(color: styles.white))
          ],
        ),
        IconButton(onPressed: ()=>onPressed(), icon: Icon(Icons.navigate_next, color: styles.white,size: 24.h,))
      ],
    );
  }
}