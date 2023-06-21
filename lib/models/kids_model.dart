class KidsModel {
  final String name;
  final int age;
  final String? school;
  final String? image;

  KidsModel({
    required this.name,
    required this.age,
    this.school,
    this.image,
  });
}
