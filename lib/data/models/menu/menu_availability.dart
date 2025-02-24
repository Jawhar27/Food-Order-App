class MenuAvailability {
  final String startTime;
  final String endTime;

  // Constructor
  MenuAvailability({
    required this.startTime,
    required this.endTime,
  });

  // Method to create a MenuAvailability object from JSON
  factory MenuAvailability.fromJson(Map<String, dynamic> json) {
    return MenuAvailability(
      startTime: json['StartTime'],
      endTime: json['EndTime'],
    );
  }

  // Method to convert the MenuAvailability object back to JSON
  Map<String, dynamic> toJson() {
    return {
      'StartTime': startTime,
      'EndTime': endTime,
    };
  }
}
