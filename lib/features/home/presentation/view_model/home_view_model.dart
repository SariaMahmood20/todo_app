import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/utils/utils_functions.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';
import 'package:todo_app/features/home/data/services/add_task_service.dart';

class HomeViewModel extends ChangeNotifier {
  final AddTaskService _taskService = AddTaskService();

  // List of tasks
  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  // List of filtered tasks
  List<TaskModel> _filteredTasks = [];
  List<TaskModel> get filteredTasks => _filteredTasks;

  //Date Filter
  List<TaskModel> _dateFilteredTasks = [];
  List<TaskModel> get dateFilteredTasks => _dateFilteredTasks;

  //Done Filter
  List<TaskModel> _doneTasks = [];
  List<TaskModel> get doneTasks => _doneTasks;

  //Undone Filter
  List<TaskModel> _undoneTasks = [];
  List<TaskModel> get undoneTasks => _undoneTasks;

  // Loading state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Error message
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // Add a new task
  Future<void> addTask({
    required String title,
    required String description,
    required String category,
    required String priority,
    required String time,
    bool isDone = false,
    required BuildContext context,
  }) async {
    _setLoading(true);
    try {
      await _taskService.writeTask(title, description, category, priority, time, isDone);
      UtilsFunctions.showFlushBar(context, false, "Task Added Successfully!");
      await fetchTasks(); // Refresh tasks after adding
    } catch (e) {
      UtilsFunctions.showFlushBar(context, true, "Failed to add task: $e");
    } finally {
      _setLoading(false);
    }
  }

  // Fetch tasks from the service
  Future<void> fetchTasks() async {
    _setLoading(true);
    try {
      final tasks = await _taskService.getTasks();
      _tasks = tasks;
      _filteredTasks = tasks; // Initially, show all tasks
      _setError(null); // Clear previous errors if successful
    } catch (e) {
      _setError("Failed to fetch tasks: $e");
    } finally {
      _setLoading(false);
    }
  }

  // Filter tasks based on search word
  Future<void> filterTasks(String word) async {
    try {
      if (_tasks.isNotEmpty) {
        // Filter tasks based on the search word
        final filteredTasks = _tasks.where((task) => task.title.contains(word)).toList();
        _filteredTasks = filteredTasks;
        notifyListeners(); // Notify the UI about the changes
      }
    } catch (e) {
      print("Error filtering tasks: $e");
    }
  }

  // Clear the task filter and show all tasks
  void clearFilter() {
    _filteredTasks = _tasks; // Show all tasks again
    notifyListeners(); // Notify the UI about the changes
  }

  // Update a task
  Future<void> updateTask({
    required String title,
    required String description,
    required String category,
    required String priority,
    required String time,
    bool isDone = false,
    required BuildContext context,
  }) async {
    _setLoading(true);
    try {
      await _taskService.updateTask(title, description, category, priority, time, isDone);
      UtilsFunctions.showFlushBar(context, false, "Task Updated Successfully!");
      await fetchTasks(); // Refresh tasks after updating
    } catch (e) {
      UtilsFunctions.showFlushBar(context, true, "Failed to update task: $e");
    } finally {
      _setLoading(false);
    }
  }

  // Delete a task
  Future<void> deleteTask(int taskId, BuildContext context) async {
    _setLoading(true);
    try {
      await _taskService.removeTask(taskId);
      UtilsFunctions.showFlushBar(context, false, "Task Deleted Successfully!");
      await fetchTasks(); // Refresh tasks after deletion
    } catch (e) {
      UtilsFunctions.showFlushBar(context, true, "Failed to delete task: $e");
    } finally {
      _setLoading(false);
    }
  }

  Future<List<dynamic>> dateFilter(String date)async{
    _dateFilteredTasks = _tasks.where((task)=> task.time == date).toList();
    return _dateFilteredTasks;
  }

  Future<List<dynamic>> doneFilter()async{
    _doneTasks = _tasks.where((task)=>task.isDone == true).toList();
    return _doneTasks;
  }

  Future<List<dynamic>> undoneFilter()async{
    _undoneTasks = _tasks.where((task)=>task.isDone == false).toList();
    return _undoneTasks;
  }

  // Helper: Set loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Helper: Set error message
  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
