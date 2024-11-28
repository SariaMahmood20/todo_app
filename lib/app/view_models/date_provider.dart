import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todo_app/app/views/widgets/category_dialog_box.dart';
import 'package:todo_app/app/views/widgets/priority_dialog_box.dart';
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
      builder: (context)=>const CategoryDialogBox()
    );
    if (selectedCategory != null) {
      print("Selected Category: $selectedCategory");
    }
  }

  Future<void> priorityTag(BuildContext context)async{
    final String? selectedPriority = await showDialog<String>(
      context: context, 
      builder: (context)=>const PriorityDialogBox()
      );
      if(selectedPriority!=null){
        print("Selected Priority: $selectedPriority");
      }
  }
}
