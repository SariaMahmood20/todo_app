import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/app/constants/images.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/introduction.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), 
    (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const OnBoarding()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage(Images.splash),
                  height: 140.h,
                  width: 155.w,
                  ),
              Text(
                AppStrings.uptodo,
                style: styles.lato40w700,
              )
            ],
          )
      ),
    );
  }
}