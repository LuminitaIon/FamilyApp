import 'package:intl/intl.dart';

class EventModel {
  final String title;
  final String place;
  final DateTime time;
  final String description;
  final List<String> participants;

  EventModel({
    required this.title,
    required this.place,
    required this.time,
    required this.description,
    required this.participants,
  });

  String get date => DateFormat("dd-MM-yyyy").format(time);
  String get hour => DateFormat("hh:mm").format(time);
}
