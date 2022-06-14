import 'package:flutter/cupertino.dart';
import 'package:kiteup/dummy%20data/users.dart';
import 'package:kiteup/dummy%20data/locations.dart';

enum EventType {
  GOING,
  CANCEL,
  KITING
}

class Event extends ChangeNotifier {
  final Location location;
  final DateTime createdAt;
  final EventType type;
  final User user;
  final DateTime? datetime;

  Event({
    required this.location,
    required this.createdAt,
    required this.type,
    required this.user,
    this.datetime,
  });

  @override
  String toString() {
    return 'Event{location: $location, createdAt: $createdAt, type: $type, user: $user, datetime: $datetime}';
  }
}



List<Event> allEvents = [
  Event(location: allLocations[0], createdAt: DateTime.parse("1969-07-20 12:10:00"), type: EventType.GOING, user: allUsers[0], datetime: DateTime.parse("1969-07-20 12:10:00")),
  Event(location: allLocations[1], createdAt: DateTime.parse("1969-07-20 13:10:00"), type: EventType.GOING, user: allUsers[1], datetime: DateTime.parse("1969-07-20 13:10:00")),
  Event(location: allLocations[2], createdAt: DateTime.parse("1969-07-20 05:10:00"), type: EventType.GOING, user: allUsers[2], datetime: DateTime.parse("1969-07-20 05:10:00")),
  Event(location: allLocations[3], createdAt: DateTime.parse("1969-07-20 07:10:00"), type: EventType.GOING, user: allUsers[3], datetime: DateTime.parse("1969-07-20 07:10:00")),
];