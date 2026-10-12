class Event {
  String title;
  DateTime date;
  String category;
  String location;
  String description;
  bool completed;

  Event({
    required this.title,
    required this.date,
    required this.category,
    this.location = '',
    this.description = '',
    this.completed = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'category': category,
      'location': location,
      'description': description,
      'completed': completed,
    };
  }

  static Event fromMap(Map<String, dynamic> map) {
    return Event(
      title: map['title'],
      date: DateTime.parse(map['date']),
      category: map['category'],
      location: map['location'] ?? '',
      description: map['description'] ?? '',
      completed: map['completed'] ?? false,
    );
  }
}

List<String> categories = ['Class', 'Assignment', 'Club', 'Campus Event', 'Personal'];
