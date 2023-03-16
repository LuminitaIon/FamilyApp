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