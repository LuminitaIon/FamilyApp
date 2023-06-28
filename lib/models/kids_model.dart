
class KidsModel {
  final String id;
  final String name;
  final int age;
  final String? school;
  final String? image;
  final DateTime birhDate;

  KidsModel({
    required this.id,
    required this.name,
    required this.age,
    required this.birhDate,
    this.school,
    this.image,
  });

  static KidsModel fromJson(Map<String, dynamic> json) => KidsModel(
    id: json["kid_id"],
    name: json["kid_name"],
    age: json["kid_age"],
      birhDate: json["birthdate"].toDate(),
    school: json["kid_school"],
    image: json["kid_image_path"]
  );

  Map<String, dynamic> toJson() => {
    "kid_id": id,
    "kid_name": name,
    "kid_age": age,
    "birthdate": birhDate,
    "kid_school": school,
    "kid_image_path": image
  };
}
