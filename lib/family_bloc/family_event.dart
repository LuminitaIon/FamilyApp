part of 'family_bloc.dart';

abstract class FamilyEvent {}

class CreateFamilyEvent extends FamilyEvent {
  String idParent;
  String familyName;
  DateTime? weddingDate;
  DateTime? firstMeetingDate;

  CreateFamilyEvent(
      {required this.idParent,
      required this.familyName,
      this.weddingDate,
      this.firstMeetingDate});
}

class GetFamilyFirebaseEvent extends FamilyEvent {
  FamilyModel family;

  GetFamilyFirebaseEvent(this.family);
}

class UpdateFamilyEvent extends FamilyEvent {
  String id;

  UpdateFamilyEvent(this.id);
}

class GetFamilyEvent extends FamilyEvent {
  String? userId;

  GetFamilyEvent(this.userId);
}
class AddChild extends FamilyEvent {
  KidsModel kid;

  AddChild(this.kid);
}
