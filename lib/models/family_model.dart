import 'package:equatable/equatable.dart';

class FamilyModel extends Equatable {
  String id;
  String? idParent1;
  String? idParent2;
  String familyName;
  String familyCode;

  FamilyModel({
    required this.id,
    required this.familyName,
    required this.familyCode,
    this.idParent1,
    this.idParent2,
  });

  static FamilyModel fromJson(Map<String, dynamic> json) => FamilyModel(
      id: json["family_id"],
      familyName: json["family_name"],
      familyCode: json["family_code"],
      idParent1: json["id_firstParent"],
      idParent2: json["id_secondParent"]);

  Map<String, dynamic> toJson() => {
    "family_id": id,
    "family_name": familyName,
    "family_code": familyCode,
    "id_firstParent": idParent1,
    "id_secondParent": idParent2,
  };

  @override
  List<Object?> get props => [id, familyName, familyCode, idParent1, idParent2];
}
