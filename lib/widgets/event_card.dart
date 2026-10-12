import 'package:flutter/material.dart';

import '../models/event.dart';
import '../providers/event_providers.dart';
import '../screens/events_screen.dart';
import '../services/storage_service.dart';
import 'category_chip.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onChanged;

  const EventCard({super.key, required this.event, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    String subtitle = formatDate(event.date);
    if (event.location != '') {
      subtitle = '$subtitle\n${event.location}';
    }

    return Card(
      child: ListTile(
        leading: Checkbox(
          value: event.completed,
          onChanged: (value) {
            event.completed = value!;
            saveEvents();
            onChanged();
          },
        ),
        title: Text(event.title),
        subtitle: Text(subtitle),
        isThreeLine: event.location != '',
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CategoryChip(category: event.category),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                events.remove(event);
                saveEvents();
                onChanged();
              },
            ),
          ],
        ),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEventScreen(event: event)),
          );
          onChanged();
        },
      ),
    );
  }
}
