import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/features/focus/data/model/focus_model.dart';
import 'package:todo_app/features/focus/data/services/focus_service.dart';

class FocusViewModel extends ChangeNotifier {
  FocusService _focusServices = FocusService();

  bool _isFocusing = false;
  bool get isFocusing => _isFocusing;

  List<FocusModel> _focuses = [];
  List<FocusModel> get focuses => _focuses;

  List<String> days = ["MON", "TUE", "WED", "THUR", "FRI", "SAT", "SUN"];
  

  List<FocusModel> _filteredFocuses = [];
  List<FocusModel> get filteredFocuses => _filteredFocuses;

  bool _isLoading = true;
  bool get Loading => _isLoading;

  String? _error;
  String? get error => _error;

  DateTime? _focusStartTime; // Tracks the start time of focus

  FocusViewModel() {
    fetchFocuses();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _error = message;
    notifyListeners();
  }

  void _setFocus(bool value) {
    if (value == _isFocusing) return; // Avoid unnecessary updates
    if (value) {
      _focusStartTime = DateTime.now(); // Start tracking time
    } else if (_focusStartTime != null) {
      // Calculate duration and store focus data
      final duration = DateTime.now().difference(_focusStartTime!);
      _focusStartTime = null; // Reset start time
      _storeFocus(duration);
    }
    _isFocusing = value;
    notifyListeners();
  }

  Future<void> fetchFocuses() async {
    _setLoading(true);
    try {
      _focuses = await _focusServices.getFocuses();
      _error = null;
      notifyListeners();
    } catch (e) {
      _setError("${e.toString()}");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addFocus(String day, int minutes) async {
    _setLoading(true);
    try {
      await _focusServices.addFocus(day, minutes);
      FocusModel focus = FocusModel(day: day, time: minutes);
      _focuses.add(focus);
      notifyListeners();
    } catch (e) {
      _setError("${e.toString()}");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> removeFocus(String focusId) async {
    _setLoading(true);
    try {
      await _focusServices.removeFocus(focusId);
      _focuses.removeWhere((focus) => focus.id == focusId);
      notifyListeners();
    } catch (e) {
      _setError("${e.toString()}");
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateFocus(String focusId, FocusModel updatedFocus) async {
    _setLoading(true);
    try {
      await _focusServices.updateFocus(focusId, updatedFocus);
      int index = _focuses.indexWhere((focus) => focus.id == focusId);
      if (index != -1) {
        _focuses[index] = updatedFocus;
        notifyListeners();
      }
    } catch (e) {
      _setError(("${e.toString()}"));
    } finally {
      _setLoading(false);
    }
  }

  void toggleFocus() {
    _setFocus(!_isFocusing);
  }

  Future<void> _storeFocus(Duration duration) async {
    final now = DateTime.now();
    final focusDate = DateTime(now.year, now.month, now.day);
    final formattedDate = DateFormat('EEEE').format(focusDate);
    final focusTime = duration;

    FocusModel newFocus = FocusModel(day: formattedDate, time: focusTime.inMinutes);
    try {
      await _focusServices.addFocus(formattedDate, focusTime.inMinutes);
      _focuses.add(newFocus);
      notifyListeners();
    } catch (e) {
      _setError("${e.toString()}");
    }
  }
}
