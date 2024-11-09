import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidgetViewModel extends ChangeNotifier{

  int _year = DateTime.now().year;
  List<String> _months = [];
  Map<String, List<DateTime>> _daysInMonth = {};

  DateWidgetViewModel(){
    _initializeMonths();
    _initilaizeDaysInMonth();
    print(_daysInMonth);
  }

  int get year => _year;
  set year(int newYear){
    if(year!=newYear){
      _year = newYear;

      notifyListeners();
    }
  }

  List<String> get months => _months;

  List<DateTime> getDaysInMonth(String monthName){
    return _daysInMonth[monthName]?? [];
  }

  void _initializeMonths(){
    for(int month = 1; month <= 12; month++){
      final DateTime date = DateTime(_year, month);
      _months.add(DateFormat.MMM().format(date));
    }
  }

  void _initilaizeDaysInMonth(){
    _daysInMonth.clear();
    for (int month = 1; month <= 12; month++){
      final String monthName = DateFormat.MMM().format(DateTime(_year, month));
      _daysInMonth[monthName] = _getDaysInMonth(_year, month);
    }
  }

  List<DateTime> _getDaysInMonth(int year, int month){
    final List<DateTime> days = [];
    int totalDays = DateTime(year, month + 1, 0).day;
    for (int day = 1; day <= totalDays; day++){
      days.add(DateTime(year, month, day));
    }
    print(days);
    return days;
  }

}