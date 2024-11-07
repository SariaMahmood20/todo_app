import 'package:flutter/material.dart';

import 'package:todo_app/app/resources/app_theme.dart';

class TextRow extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Function onPressed;
  const TextRow({super.key,required this.onPressed, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return GestureDetector(
      onTap:(){onPressed;},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(firstText, style: styles.lato16w400.copyWith(color: Colors.grey),),
          TextButton(onPressed: (){onPressed;}, child: Text(secondText, style: styles.lato16w400,))
        ],
      ),
    );
  }
}