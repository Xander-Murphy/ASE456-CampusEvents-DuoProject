import 'package:flutter/material.dart';

import '../providers/event_providers.dart';
import '../services/storage_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Saved events'),
          trailing: Text('${events.length}'),
        ),
        ListTile(
          title: const Text('Delete completed events'),
          onTap: () {
            setState(() {
              events.removeWhere((e) => e.completed);
            });
            saveEvents();
          },
        ),
        ListTile(
          title: const Text('Delete all events'),
          onTap: () {
            setState(() {
              events.clear();
            });
            saveEvents();
          },
        ),
        const ListTile(
          title: Text('Campus Event Planner'),
          subtitle: Text('Xander Murphy & Joseph Gallucci'),
        ),
      ],
    );
  }
}
