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
       this.firstName ='',
        DateTime? birthDateTime,
      required this.id,
      DateTime? weddingDateTime,
      DateTime? firstMeetingDateTime,
      this.imagePath = "",
      required this.email})
      : weddingDate = weddingDateTime ?? initTime,
        firstMeeting = firstMeetingDateTime ?? initTime,
  birthDate = birthDateTime ?? initTime;

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        familyName: json["family_name"],
        firstName: json["first_name"],
        birthDateTime: json["birth_date"]?.toDate()  ,
        id: json["uid"],
        email: json["email"],
        weddingDateTime: json["wedding_date"]?.toDate(),
        firstMeetingDateTime:  json["first_meeting"]?.toDate(),
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "family_name": familyName,
        "first_name": firstName,
        "birth_date": birthDate,
        "uid": id,
        "email": email,
        "weddingDate": weddingDate,
        "first_meeting": firstMeeting,
        "image_path": imagePath,
      };

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
