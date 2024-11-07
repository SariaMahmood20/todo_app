import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:todo_app/app/resources/app_theme.dart';

class LoginWith extends StatelessWidget {
  final String svgPath;
  final Function onPressed;
  final String loginWith;
  const LoginWith({super.key,required this.loginWith, required this.svgPath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return GestureDetector(
      onTap: (){onPressed;},
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: styles.neutralColor,
            width: 2.w,
          )
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                height: 24.h,
                width: 24.w,
              ),
              SizedBox(width: 10.w,),
              Text(
                loginWith,
                style: styles.lato16w400,
              )
            ],
          ),
        ),
      ),
    );
  }
}