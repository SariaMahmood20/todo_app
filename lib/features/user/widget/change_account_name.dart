import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/views/widgets/custom_form_field.dart';
import 'package:todo_app/app/views/widgets/button.dart';

class ChangeAccountName extends StatelessWidget {
  final Function onPressed;
  final TextEditingController controller;
  const ChangeAccountName({super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.changeAccountName, style: styles.lato16w700,),
          SizedBox(height: 7.h,),
          const Divider()
        ],
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFormField(controller: controller, isPassword: false, hintText: AppStrings.changeAccountName, labelText: "Account Name"),
          SizedBox(height: 40.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: (){}, child: Text(AppStrings.cancel, style: styles.lato16w400.copyWith(color: styles.neutralColor),)),
              Button(width: 150.w, buttonText: AppStrings.edit, onPressed: ()=>onPressed())
            ],
          )
        ],
      ),
    );
  }
}