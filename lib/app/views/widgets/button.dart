import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/app/resources/app_theme.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final double width;
  final String buttonText;
  const Button({super.key, required this.width, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return GestureDetector(
      onTap: (){onPressed;},
      child: Container(
        width: width.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: styles.neutralColor,
          borderRadius: BorderRadius.circular(4.w),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: styles.lato16w400.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}