import 'package:equatable/equatable.dart';

import 'kids_model.dart';

class FamilyModel extends Equatable {
  String id;
  String? idParent1;
  String? idParent2;
  String familyName;
  String familyCode;
  List<KidsModel> children;

  FamilyModel({
    required this.id,
    required this.familyName,
    required this.familyCode,
    this.idParent1,
    this.idParent2,
    this.children = const [],
  });

  FamilyModel copyWith({
    String? id,
    String? idParent1,
    String? idParent2,
    String? familyName,
    String? familyCode,
    List<KidsModel>? children,
  }) =>
      FamilyModel(
        id: id ?? this.id,
        idParent1: idParent1 ?? this.idParent1,
        idParent2: idParent2 ?? this.idParent2,
        familyName: familyName ?? this.familyName,
        familyCode: familyCode ?? this.familyCode,
        children: children ?? this.children,
      );

  static FamilyModel fromJson(Map<String, dynamic> json) => FamilyModel(
        id: json["family_id"],
        familyName: json["family_name"],
        familyCode: json["family_code"],
        idParent1: json["id_firstParent"],
        idParent2: json["id_secondParent"],
        children: (json["children"] as List?)
            ?.map((e) => KidsModel.fromJson(e))
            .toList() ?? [],
      );

  Map<String, dynamic> toJson() => {
        "family_id": id,
        "family_name": familyName,
        "family_code": familyCode,
        "id_firstParent": idParent1,
        "id_secondParent": idParent2,
        "children": children.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, familyName, familyCode, idParent1, idParent2,children];
}
