import '../models/event.dart';

// Every screen reads and changes this list directly.
List<Event> events = [];

String formatDate(DateTime d) {
  String minute = d.minute < 10 ? '0${d.minute}' : '${d.minute}';
  int hour = d.hour % 12 == 0 ? 12 : d.hour % 12;
  String amPm = d.hour < 12 ? 'AM' : 'PM';
  return '${d.month}/${d.day}/${d.year} $hour:$minute $amPm';
}
