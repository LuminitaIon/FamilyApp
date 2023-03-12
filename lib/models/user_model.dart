import 'package:equatable/equatable.dart';

import '../utils.dart';

class UserModel extends Equatable {
  String id;
  String familyName;
  String firstName;
  DateTime birthDate;
  DateTime weddingDate;
  DateTime firstMeeting;
  String imagePath;
  String email;

  UserModel(
      {required this.familyName,
      required this.firstName,
      required this.birthDate,
      required this.id,
      DateTime? weddingDateTime,
      DateTime? firstMeetingDateTime,
      this.imagePath = "",
      required this.email})
      : weddingDate = weddingDateTime ?? initTime,
        firstMeeting = firstMeetingDateTime ?? initTime;

  @override
  List<Object?> get props => [
        id,
        familyName,
        firstName,
        birthDate,
        weddingDate,
        firstMeeting,
        imagePath,
        email
      ];
}
