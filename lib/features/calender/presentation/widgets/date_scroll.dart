import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_theme.dart';

class DateScroll extends StatefulWidget {
  final String month;
  final String year;
  final String date;
  final String day;
  const DateScroll({super.key, required this.date, required this.day, required this.month, required this.year});

  @override
  State<DateScroll> createState() => _DateScrollState();
}

class _DateScrollState extends State<DateScroll> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
