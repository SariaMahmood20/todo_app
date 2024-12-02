class FocusModel {
  String? id; // Make id nullable for cases where it is not provided
  DateTime day;
  DateTime time;

  // Constructor
  FocusModel({
    this.id,
    required this.day,
    required this.time,
  });

  // Factory method to create a FocusModel from a JSON object
  factory FocusModel.fromJson(Map<String, dynamic> json) {
    return FocusModel(
      id: json['id'] as String?, // Parse id if it exists
      day: DateTime.parse(json['Day']), // Parse 'Day' as DateTime
      time: DateTime.parse(json['Time']), // Parse 'Time' as DateTime
    );
  }

  // Method to convert the FocusModel into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include id in JSON if it exists
      'Day': day.toIso8601String(), // Convert DateTime to ISO8601 string
      'Time': time.toIso8601String(), // Convert DateTime to ISO8601 string
    };
  }
}
