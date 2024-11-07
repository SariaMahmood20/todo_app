import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_floating_bottom_nav_bar/floating_bottom_nav_bar.dart';
import 'package:simple_floating_bottom_nav_bar/floating_item.dart';

import 'package:todo_app/app/constants/svg_icons.dart';
import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/features/home/presentation/view/home_view.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({super.key});

  final List<FloatingBottomNavItem> items = [
    FloatingBottomNavItem(
      inactiveIcon: SvgPicture.asset(SvgIcons.homeInactve),
      activeIcon: SvgPicture.asset(SvgIcons.homeActive),
      label: AppStrings.index
      ),
    FloatingBottomNavItem(
      inactiveIcon: SvgPicture.asset(SvgIcons.calenderInactive),
      activeIcon: SvgPicture.asset(SvgIcons.calenderActive),
      label: AppStrings.calender
      ),
    FloatingBottomNavItem(
      inactiveIcon: SvgPicture.asset(SvgIcons.focusInactive),
      activeIcon: SvgPicture.asset(SvgIcons.focusActive),
      label: AppStrings.focus
      ),
    FloatingBottomNavItem(
      inactiveIcon: SvgPicture.asset(SvgIcons.user),
      label: AppStrings.profile,
      )
  ];

  final List<Widget> pages = [
    const HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: FloatingBottomNavBar(
          pages: pages, 
          items: items ,
          initialPageIndex: 0,
          backgroundColor: styles.neutralColor,
          radius: 50,
          width: double.infinity,
          height: 70.h,
          ),
      ),
    );
  }
}