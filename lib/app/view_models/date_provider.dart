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

  String _category = "";
  String get category=> _category;

  String _priority = "";
  String get priority=> _priority;
  

  DateTime deadlineDate = DateTime.now();

  String get finalDate => deadlineDate.toString();

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: deadlineDate,
      firstDate: deadlineDate.subtract(const Duration(days: 7)),
      lastDate: DateTime(2200),
    );
    if (pickedDate != null && pickedDate != deadlineDate) {
      deadlineDate = pickedDate;
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
      _category = selectedCategory.toString();
    }
  }

  Future<void> priorityTag(BuildContext context)async{
    final String? selectedPriority = await showDialog<String>(
      context: context, 
      builder: (context)=>const PriorityDialogBox()
      );
      if(selectedPriority!=null){
        print("Selected Priority: $selectedPriority");
        _priority = selectedPriority.toString();
      }
  }
}
