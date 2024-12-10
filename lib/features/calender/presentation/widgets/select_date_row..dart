import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/constants/svg_icons.dart';

class SelectDateRow extends StatelessWidget {
  final Function onPressed;
  final String date;
  const SelectDateRow({super.key, required this.date, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(onPressed: (){onPressed();}, icon: SvgPicture.asset(SvgIcons.calenderActive, color: Colors.white, height: 25.h,width: 25.h,)),
        SizedBox(width: 20.w,),
        Text(
          date.isEmpty? AppStrings.chooseTIme: date,
          style: styles.lato16w400.copyWith(color: Colors.grey),
        )
      ],
            ),
    );
  }
}
