class FocusModel {
  String? id; // Nullable id for cases where it is not provided
  String day; // Day remains a DateTime
  int time; // Duration in seconds or minutes

  // Constructor
  FocusModel({
    this.id,
    required this.day,
    required this.time, // Accepts time as an int
  });

  // Factory method to create a FocusModel from a JSON object
  factory FocusModel.fromJson(Map<String, dynamic> json) {
    return FocusModel(
      id: json['id'] as String?, // Parse id if it exists
      day: json['Day'] as String, // Parse 'Day' as DateTime
      time: json['Time'] as int, // Parse 'Time' as an int
    );
  }

  // Method to convert the FocusModel into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include id in JSON if it exists
      'Day': day, // Convert DateTime to ISO8601 string
      'Time': time, // Include time as an int
    };
  }
}
