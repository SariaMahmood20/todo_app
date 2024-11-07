import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/app/resources/app_theme.dart';

class AddTaskFields extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const AddTaskFields({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: styles.lato16w400.copyWith(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: styles.neutralColor, width: 2.w),
        ),
        border: InputBorder.none,
        
      ),
    );
  }
}