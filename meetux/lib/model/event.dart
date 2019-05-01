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

  Event.fromMap(Map<String, dynamic> data, String id)
      : this(
  id: id,
  type: EventType.values[data['type']],
  name: data['name'],
  duration: Duration(minutes: data['duration']),
  requirements: new List<String>.from(data['requirements']),
  info: new List<String>.from(data['info']),
  imageURL: data['image'],
  );

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