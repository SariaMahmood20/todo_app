import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/app/resources/app_theme.dart';

class DayDate extends StatefulWidget {
  final String day;
  final String date;
  const DayDate({super.key, required this.date, required this.day});

  @override
  State<DayDate> createState() => _DayDateState();
}

class _DayDateState extends State<DayDate> {

  

  bool _isSelected = false;

  void selected(){
    setState(() {
      
      _isSelected = !_isSelected;    
    });
  }
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        height: 49.h,
        width: 38.w,
        padding: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          color: _isSelected? styles.neutralColor: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.day, style: styles.lato12w700,),
            Text(widget.date, style: styles.lato12w700,)
          ],
        ),
      ),
    );
  }
}