import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/event.dart';
import '../providers/event_providers.dart';

Future<void> loadEvents() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data = prefs.getString('events');
  if (data != null) {
    List list = jsonDecode(data);
    events = list.map((e) => Event.fromMap(e)).toList();
  }
}

Future<void> saveEvents() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List list = events.map((e) => e.toMap()).toList();
  await prefs.setString('events', jsonEncode(list));
}
