import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/app/resources/app_theme.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  const CustomFormField({super.key, required this.labelText, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: styles.lato16w400,
        hintText: hintText,
        hintStyle: styles.lato16w400.copyWith(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.w),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.w
          )
        )
      ),
    );
  }
}