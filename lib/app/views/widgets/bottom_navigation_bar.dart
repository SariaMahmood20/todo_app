import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'package:todo_app/app/constants/svg_icons.dart';
import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/views/widgets/my_appbar.dart';
import 'package:todo_app/features/home/presentation/view/home_view.dart';
import 'package:todo_app/app/utils/utils_functions.dart';
import 'package:todo_app/features/focus/presentation/view/focus_view.dart';
import 'package:todo_app/features/calender/presentation/view/calender_view.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int selected = 0;

  final controller = PageController();

  final List<BottomBarItem> items = [
    BottomBarItem(
      icon: SvgPicture.asset(SvgIcons.homeInactve), 
      title: Text(AppStrings.index),
      selectedIcon: SvgPicture.asset(SvgIcons.homeActive),
    ),
    BottomBarItem(
      icon: SvgPicture.asset(SvgIcons.calenderInactive), 
      title: Text(AppStrings.calender),
      selectedIcon: SvgPicture.asset(SvgIcons.calenderActive),
    ),
    BottomBarItem(
      icon: SvgPicture.asset(SvgIcons.focusInactive), 
      title: Text(AppStrings.focus),
      selectedIcon: SvgPicture.asset(SvgIcons.focusActive),
    ),
    BottomBarItem(
      icon: SvgPicture.asset(SvgIcons.user), 
      title: Text(AppStrings.profile),
    ),
  ];

  final List<Widget> pages = [
    HomeView(),
    CalenderView(),
    FocusView(),
    Container(color: Colors.green,),
  ];

  final List<String> titles = [
    AppStrings.index,
    AppStrings.calender,
    AppStrings.focusMode,
    AppStrings.profile,
  ];

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      appBar: MyAppbar(appbarTitle: titles[selected]),
      bottomNavigationBar: StylishBottomBar(
        items: items,
        option: AnimatedBarOptions(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          barAnimation: BarAnimation.blink,
        ),
        backgroundColor: Colors.transparent,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected,
        notchStyle: NotchStyle.circle,
        onTap: (index) {
          if (index == selected) return;
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                selected = index;
              });
            },
            children: pages, // Use the pages list
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UtilsFunctions.addTask(context);
        },
        shape: const CircleBorder(),
        backgroundColor: styles.neutralColor,
        child: Icon(Icons.add, color: styles.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
