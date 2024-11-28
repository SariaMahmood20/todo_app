import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_introduction/animated_introduction.dart';
import 'package:go_router/go_router.dart';

import 'package:todo_app/app/constants/images.dart';
import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/navigation/route_names.dart';

final List<SingleIntroScreen> pages = [
  SingleIntroScreen(
    title: AppStrings.manageYourTask, 
    description: "You can easily manage all of your daliy tasks in UpTodo for free",
    imageAsset: Images.onboarding1,
  ),
  SingleIntroScreen(
    title: AppStrings.createDailyRoutine, 
    description: "In UpTodo you can create your personalized routine to stay productive",
    imageAsset: Images.onboarding2,
  ),
  SingleIntroScreen(
    title: AppStrings.organizeYourTasks, 
    description: "You can organize your daily tasks by adding your tasks into seperate categories",
    imageAsset: Images.onboarding3,
    )
];

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final styles =Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: AnimatedIntroduction(
        slides: pages, 
        onDone: (){
          GoRouter.of(context).pushReplacementNamed(RouteNames.login);
        },
        isFullScreen: true,
        footerGradients: [styles.neutralColor, styles.neutralColor.withOpacity(0.6)],
        doneText: AppStrings.getStarted,
        containerBg: Colors.transparent,
        footerPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        indicatorType: IndicatorType.line,
        ),
    );
  }
}

