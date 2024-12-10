import 'package:flutter/material.dart';
import 'package:todo_app/app/resources/app_theme.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final String labelText;
  const CustomFormField({super.key, required this.controller, required this.isPassword, required this.hintText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: styles.neutralColor)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
      ),
    );
  }
}