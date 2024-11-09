import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:todo_app/app/resources/app_theme.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String iconPath;
  final Color categoryColor;
  const CategoryWidget({super.key, required this.categoryColor, required this.categoryName, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            color: categoryColor,
            child: Center(
              child: SvgPicture.asset(iconPath, height: 32.h, width: 32.w,)
            ),
          ),
        ),
        SizedBox(height: 5.h,),
        Text(categoryName, style: styles.lato14w600,)
      ],
    );
  }
}
