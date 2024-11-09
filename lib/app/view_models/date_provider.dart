import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/app/resources/app_strings.dart';
import 'package:todo_app/app/resources/app_theme.dart';
import 'package:todo_app/app/views/widgets/category_widget.dart';
import 'package:todo_app/app/constants/svg_icons.dart';

final List<String> categoryName = [
  "Home",
  "Work",
  "Office"
];

final List<String> iconPath = [
  SvgIcons.home,
  SvgIcons.work,
  SvgIcons.sport
];

const List<Color> categoryColor = [
  Colors.amber,
  Colors.pinkAccent,
  Colors.yellowAccent
];

class DateProvider with ChangeNotifier {
  String formatDate(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }

  DateTime leaveDate = DateTime.now();

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: leaveDate,
      firstDate: leaveDate.subtract(const Duration(days: 7)),
      lastDate: DateTime(2200),
    );
    if (pickedDate != null && pickedDate != leaveDate) {
      leaveDate = pickedDate;
      notifyListeners();
    }
  }

  Future<void> categoryTag(BuildContext context) async {
    final String? selectedCategory = await showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) {
        final style = Theme.of(dialogContext).extension<AppTheme>()!;
        return AlertDialog(
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.h),

          ),
          title: Text(
            AppStrings.chooseCategory,
            style: style.lato16w700,
          ),
          content: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: categoryName.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.pop(dialogContext, categoryName[index]);
                },
                child: CategoryWidget(
                  categoryColor: categoryColor[index],
                  categoryName: categoryName[index],
                  iconPath: iconPath[index],
                ),
              );
            },
          ),
        );
      },
    );
    if (selectedCategory != null) {
      print("Selected Category: $selectedCategory");
    }
  }
}
