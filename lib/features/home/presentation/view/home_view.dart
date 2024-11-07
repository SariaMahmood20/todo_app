import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/features/home/presentation/widgets/empty_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyScreen();
  }
}