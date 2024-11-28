import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:todo_app/app/resources/app_theme.dart';


class TextRow extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String path;
  const TextRow({super.key,required this.path, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText, style: styles.lato16w400.copyWith(color: Colors.grey),),
        TextButton(onPressed: (){GoRouter.of(context).pushReplacementNamed(path);}, child: Text(secondText, style: styles.lato16w400,))
      ],
    );
  }
}