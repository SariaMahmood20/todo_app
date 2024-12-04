class TaskModel {
  TaskModel({
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.time,
    this.isDone = false, // Default value for isDone
  });

  late final String title;
  late final String description;
  late final String category;
  late final String priority;
  late final String time;
  late bool isDone;

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    category = json['category'];
    priority = json['priority'];
    time = json['time'];
    isDone = json['isDone'] ?? false; // Default to false if not present
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['category'] = category;
    _data['priority'] = priority;
    _data['time'] = time;
    _data['isDone'] = isDone;
    return _data;
  }
}
