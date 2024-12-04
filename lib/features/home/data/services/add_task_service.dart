import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/home/data/models/task_model.dart';

class AddTaskService {
  final DatabaseReference _taskDatabase = FirebaseDatabase.instance.ref("tasks");
  final DatabaseReference _userDatabase = FirebaseDatabase.instance.ref("users");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add a new task to the database
  Future<void> writeTask(String title, String description, String category, String priority, String time, bool isDone) async {
    try {
      // Get the current user
      User? user = _auth.currentUser;

      if (user == null) {
        print("No user is logged in.");
        return;
      }

      String taskId = _taskDatabase.push().key!; // Generate unique task ID

      // Save the task data under the user’s specific tasks node
      await _taskDatabase.child(user.uid).child(taskId).set({
        "id": taskId,
        "title": title,
        "description": description,
        "category": category,
        "priority": priority,
        "time": time,
        "isDone": isDone
      });

      print("Task added successfully!");
    } catch (e) {
      print("Error writing task: $e");
    }
  }

  // Retrieve all tasks from the database for the current user
  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks = [];
    try {
      User? user = _auth.currentUser;
      
      if (user == null) {
        print("No user is logged in.");
        return tasks;
      }

      final snapshot = await _taskDatabase.child(user.uid).get();

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

  // Save user data (e.g., name, email) when the user signs up or logs in
  Future<void> saveUserData(String name, String email) async {
    try {
      User? user = _auth.currentUser;

      if (user == null) {
        print("No user is logged in.");
        return;
      }

      // Save user data under the "users" node with UID as the key
      await _userDatabase.child(user.uid).set({
        "name": name,
        "email": email,
      });

      print("User data saved successfully!");
    } catch (e) {
      print("Error saving user data: $e");
    }
  }

  // Retrieve user data (e.g., name, email) for the logged-in user
  Future<Map<String, String>?> getUserData() async {
    try {
      User? user = _auth.currentUser;

      if (user == null) {
        print("No user is logged in.");
        return null;
      }

      final snapshot = await _userDatabase.child(user.uid).get();

      if (snapshot.exists) {
        // Convert the snapshot to a map
        Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.value as Map);
        return {
          "name": data['name'],
          "email": data['email'],
        };
      } else {
        print("User data not found.");
        return null;
      }
    } catch (e) {
      print("Error fetching user data: $e");
      return null;
    }
  }

  // Remove a task from the database
  Future<void> removeTask(int taskId) async {
    try {
      User? user = _auth.currentUser;

      if (user == null) {
        print("No user is logged in.");
        return;
      }

      // Delete the task from the user's tasks node
      await _taskDatabase.child(user.uid).child(taskId.toString()).remove();
      print("Task removed successfully!");
    } catch (e) {
      print("Error removing task: $e");
    }
  }

    Future<void> updateTask(
  String title,
  String description,
  String category,
  String priority,
  String time,
  bool isDone,
) async {
  try {
    User? user = _auth.currentUser;

    if (user == null) {
      print("No user is logged in.");
      return;
    }

    // Fetch all tasks for the current user
    final userTasksSnapshot = await _taskDatabase.child(user.uid).get();

    if (userTasksSnapshot.exists) {
      final tasksMap = userTasksSnapshot.value as Map<dynamic, dynamic>;

      // Find the key of the task with the matching title
      String? matchingKey;
      tasksMap.forEach((key, value) {
        if (value["title"] == title) {
          matchingKey = key;
        }
      });

      if (matchingKey != null) {
        // Update the task with the matching key
        await _taskDatabase.child(user.uid).child(matchingKey.toString()).update({
          "title": title,
          "description": description,
          "category": category,
          "priority": priority,
          "time": time,
          "isDone": isDone,
        });

        print("Task updated successfully!");
      } else {
        print("No task found with the title: $title");
      }
    } else {
      print("No tasks found for the user.");
    }
  } catch (e) {
    print("Error updating task: $e");
  }
}

}
