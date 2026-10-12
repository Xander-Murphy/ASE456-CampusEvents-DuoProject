import 'package:flutter/material.dart';

import '../providers/event_providers.dart';
import '../widgets/event_card.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List dayEvents = [];
    for (var e in events) {
      if (e.date.year == selectedDay.year &&
          e.date.month == selectedDay.month &&
          e.date.day == selectedDay.day) {
        dayEvents.add(e);
      }
    }

    return ListView(
      children: [
        CalendarDatePicker(
          initialDate: selectedDay,
          firstDate: DateTime(2020),
          lastDate: DateTime(2100),
          onDateChanged: (day) {
            setState(() {
              selectedDay = day;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Events on ${selectedDay.month}/${selectedDay.day}/${selectedDay.year}',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        if (dayEvents.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('No events on this day.'),
          ),
        for (var e in dayEvents)
          EventCard(event: e, onChanged: () => setState(() {})),
      ],
    );
  }
}
