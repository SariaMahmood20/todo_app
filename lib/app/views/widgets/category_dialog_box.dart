import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/app/constants/svg_icons.dart';
import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';

List<String> categoryNames = [
  AppStrings.work,
  AppStrings.social,
  AppStrings.sport,
  AppStrings.grocery,
];

List<String> categoryIcons = [
  SvgIcons.sport,
  SvgIcons.social,
  SvgIcons.work,
  SvgIcons.grocery
];

List<Color> categoryColors = [
  Colors.amber.withOpacity(1.0),
  Colors.yellow.withOpacity(1.0),
  Colors.pink.withOpacity(1.0),
  Colors.redAccent.withOpacity(1.0),
];

class CategoryDialogBox extends StatelessWidget {
  const CategoryDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.chooseCategory, style: styles.lato16w700,),
          SizedBox(height: 7.h),
          const Divider(),
        ],
      ),
      content: SizedBox(width: 300.w,height: 400.h,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
        itemCount: categoryNames.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: ()=>GoRouter.of(context).pop(categoryNames[index]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: categoryColors[index],
                  ),
                  child: Center(child: SvgPicture.asset(categoryIcons[index], color: Colors.white, height: 25.h, width: 25.w,)),
                ),
                SizedBox(height: 7.h,),
                Text(categoryNames[index], style: styles.lato16w400,),
                SizedBox(height: 7.h,)
              ],
            ),
          );
        }
        )
      )
    );
  }
}