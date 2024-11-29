import 'package:firebase_database/firebase_database.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';

class AddTaskService {
  final DatabaseReference _databaseService = FirebaseDatabase.instance.ref("Task");

  // Add a new task to the database
  Future<void> writeTask(String title, String description, String category, String priority, String time) async {
    try {
      // Generate a unique key for the task
      String taskId = _databaseService.push().key!;
      
      // Save the task data under the unique key
      await _databaseService.child(taskId).set({
        "id": taskId,
        "title": title,
        "description": description,
        "category": category,
        "priority": priority,
        "time": time,
      });
    } catch (e) {
      print("Error writing task: $e");
    }
  }

  // Retrieve all tasks from the database
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks = [];
    try {
      final snapshot = await _databaseService.get();

      if (snapshot.exists) {
        // Convert the snapshot value to a Map
        Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

        data.forEach((key, value) {
          // Map each value to a TaskModel object
          tasks.add(TaskModel.fromJson(Map<String, dynamic>.from(value)));
        });
      }
    } catch (e) {
      print("Error fetching tasks: $e");
    }
    return tasks;
  }
}
