import 'package:duration/duration.dart';

enum EventType {
  workshop,
  seminar,
}

class Event {
  final String id;
  final EventType type;
  final String name;
  final Duration duration;
  final List<String> requirements;
  final List<String> info;
  final String imageURL;

  String get getDurationString => prettyDuration(this.duration);

  const Event({
    this.id,
    this.type,
    this.name,
    this.duration,
    this.requirements,
    this.info,
    this.imageURL,

  });
}