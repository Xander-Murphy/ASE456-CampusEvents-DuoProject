import 'package:flutter/material.dart';

import '../models/event.dart';
import '../providers/event_providers.dart';
import '../services/storage_service.dart';
import '../widgets/event_card.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  String search = '';
  String selectedCategory = 'All';
  bool showCompleted = true;

  @override
  Widget build(BuildContext context) {
    List results = [];
    for (var e in events) {
      bool matchesSearch = e.title.toLowerCase().contains(search.toLowerCase()) ||
          e.location.toLowerCase().contains(search.toLowerCase());
      bool matchesCategory = selectedCategory == 'All' || e.category == selectedCategory;
      bool matchesCompleted = showCompleted || !e.completed;
      if (matchesSearch && matchesCategory && matchesCompleted) {
        results.add(e);
      }
    }
    results.sort((a, b) => a.date.compareTo(b.date));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Search'),
            onChanged: (value) {
              setState(() {
                search = value;
              });
            },
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 8),
            DropdownButton<String>(
              value: selectedCategory,
              items: [
                const DropdownMenuItem(value: 'All', child: Text('All')),
                for (var c in categories) DropdownMenuItem(value: c, child: Text(c)),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            const Spacer(),
            const Text('Show completed'),
            Checkbox(
              value: showCompleted,
              onChanged: (value) {
                setState(() {
                  showCompleted = value!;
                });
              },
            ),
          ],
        ),
        if (results.isEmpty) const Text('No events found.'),
        Expanded(
          child: ListView(
            children: [
              for (var e in results)
                EventCard(event: e, onChanged: () => setState(() {})),
            ],
          ),
        ),
      ],
    );
  }
}

// Used for both adding a new event and editing an existing one.
class AddEventScreen extends StatefulWidget {
  final Event? event;

  const AddEventScreen({super.key, this.event});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String category = 'Class';
  DateTime date = DateTime.now().add(const Duration(hours: 1));

  @override
  void initState() {
    super.initState();
    if (widget.event != null) {
      titleController.text = widget.event!.title;
      locationController.text = widget.event!.location;
      descriptionController.text = widget.event!.description;
      category = widget.event!.category;
      date = widget.event!.date;
    }
  }

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        date = DateTime(picked.year, picked.month, picked.day, date.hour, date.minute);
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(date),
    );
    if (picked != null) {
      setState(() {
        date = DateTime(date.year, date.month, date.day, picked.hour, picked.minute);
      });
    }
  }

  void save() {
    if (titleController.text.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a title')),
      );
      return;
    }

    if (widget.event == null) {
      events.add(Event(
        title: titleController.text.trim(),
        date: date,
        category: category,
        location: locationController.text.trim(),
        description: descriptionController.text.trim(),
      ));
    } else {
      widget.event!.title = titleController.text.trim();
      widget.event!.date = date;
      widget.event!.category = category;
      widget.event!.location = locationController.text.trim();
      widget.event!.description = descriptionController.text.trim();
    }

    saveEvents();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event == null ? 'New Event' : 'Edit Event'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 16),
          DropdownButton<String>(
            value: category,
            isExpanded: true,
            items: [
              for (var c in categories) DropdownMenuItem(value: c, child: Text(c)),
            ],
            onChanged: (value) {
              setState(() {
                category = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          Text('When: ${formatDate(date)}'),
          Row(
            children: [
              TextButton(onPressed: pickDate, child: const Text('Pick date')),
              TextButton(onPressed: pickTime, child: const Text('Pick time')),
            ],
          ),
          TextField(
            controller: locationController,
            decoration: const InputDecoration(labelText: 'Location'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: save, child: const Text('Save')),
        ],
      ),
    );
  }
}
