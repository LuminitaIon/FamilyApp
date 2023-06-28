import 'package:intl/intl.dart';

class EventModel {
  final String title;
  final String place;
  final DateTime time;
  final String description;

  EventModel({
    required this.title,
    required this.place,
    required this.time,
    required this.description,
  });

  String get date => DateFormat("dd-MM-yyyy").format(time);

  String get hour => DateFormat("hh:mm").format(time);

  static EventModel fromJson(Map<String, dynamic> json) => EventModel(
        title: json['title'],
        place: json['place'],
        time: json['time'].toDate(),
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'place': place,
        'time': time,
        'description': description,
      };
}
