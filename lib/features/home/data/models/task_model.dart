class TaskModel {
  TaskModel({
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.time,
  });
  late final String title;
  late final String description;
  late final String category;
  late final String priority;
  late final String time;
  
  TaskModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    category = json['category'];
    priority = json['priority'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['category'] = category;
    _data['priority'] = priority;
    _data['time'] = time;
    return _data;
  }
}