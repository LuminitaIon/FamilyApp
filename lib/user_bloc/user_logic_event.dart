part of 'user_logic_bloc.dart';

class UserLogicEvent extends Equatable {
  const UserLogicEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends UserLogicEvent {}

class LogoutEvent extends UserLogicEvent {}

class UpdateEvent extends UserLogicEvent {}

class DeleteEvent extends UserLogicEvent {}

class RegisterEvent extends UserLogicEvent {}

class CreateAccountEvent extends UserLogicEvent {
  String email;
  String password;
  String familyName;

  CreateAccountEvent(this.email, this.password, this.familyName);
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
    this.email,}
  );
}
