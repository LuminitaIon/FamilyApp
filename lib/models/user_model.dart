import 'package:equatable/equatable.dart';

import '../utils.dart';

class UserModel extends Equatable {
  String id;
  String familyName;
  String firstName;
  DateTime birthDate;
  String imagePath;
  String email;

  UserModel(
      {required this.familyName,
      this.firstName = '',
      DateTime? birthDateTime,
      required this.id,
      this.imagePath = "",
      required this.email})
      : birthDate = birthDateTime ?? initTime;

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        familyName: json["family_name"],
        firstName: json["first_name"],
        birthDateTime: json["birth_date"]?.toDate(),
        id: json["uid"],
        email: json["email"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "family_name": familyName,
        "first_name": firstName,
        "birth_date": birthDate,
        "uid": id,
        "email": email,
        "image_path": imagePath,
      };

  @override
  List<Object?> get props =>
      [id, familyName, firstName, birthDate, imagePath, email];
}
