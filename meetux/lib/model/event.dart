import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
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
  final DateTime dateTime;
  final String date;
  final DateTime currentTime;
  final GeoPoint geopoint;


  Event.fromMap(Map<String, dynamic> data, String id)
      : this(
  id: id,
  type: EventType.values[data['type']],
  name: data['name'],
  duration: Duration(minutes: data['duration']),
  requirements: new List<String>.from(data['requirements']),
  info: new List<String>.from(data['info']),
  imageURL: data['image'],
  dateTime: DateTime.utc(data['year'],data['month'],data['day']),
  currentTime: DateTime.now(),
  geopoint: data['geopoint']
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
    this.dateTime,
    this.date,
    this.currentTime,
    this.geopoint
  });
}


  });
}
