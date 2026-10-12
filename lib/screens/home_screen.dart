import 'package:flutter/material.dart';

import '../providers/event_providers.dart';
import '../widgets/event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List upcoming = [];
    for (var e in events) {
      if (!e.completed && e.date.isAfter(DateTime.now())) {
        upcoming.add(e);
      }
    }
    upcoming.sort((a, b) => a.date.compareTo(b.date));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Upcoming Events', style: TextStyle(fontSize: 20)),
        ),
        if (upcoming.isEmpty)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('No upcoming events. Tap + to add one.'),
          ),
        Expanded(
          child: ListView(
            children: [
              for (var e in upcoming)
                EventCard(event: e, onChanged: () => setState(() {})),
            ],
          ),
        ),
      ],
    );
  }
}
