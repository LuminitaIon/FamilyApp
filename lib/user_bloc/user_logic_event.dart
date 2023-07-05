part of 'user_logic_bloc.dart';

class UserLogicEvent extends Equatable {
  const UserLogicEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends UserLogicEvent {}

class LogoutEvent extends UserLogicEvent {

}

class UpdateEvent extends UserLogicEvent {}

class DeleteEvent extends UserLogicEvent {}

class RegisterEvent extends UserLogicEvent {}

class CreateAccountEvent extends UserLogicEvent {
  String email;
  String password;
  String familyName;

  CreateAccountEvent(this.email, this.password, this.familyName);
}

class CreateSecondParentEvent extends UserLogicEvent {
  String email;
  String password;
  String firstName;
  String familyName;
  DateTime birthDate;
  File? userPhoto;

  CreateSecondParentEvent({
    required this.email,
    required this.password,
    required this.firstName,
    required this.familyName,
    required this.birthDate,
    this.userPhoto,
  });
}

class UpdateOnFamilyCreatedEvent extends UserLogicEvent {
  String firstName;
  DateTime birthDate;
  File? userPhoto;
  String? email;

  UpdateOnFamilyCreatedEvent({
    required this.firstName,
    required this.birthDate,
    this.userPhoto,
    this.email,
  });
}

class GetUserEvent extends UserLogicEvent {
  String? id;

  GetUserEvent(this.id);
}
