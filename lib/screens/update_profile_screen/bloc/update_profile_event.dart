part of 'update_profile_bloc.dart';

class UpdateProfileEvent {}

class PhotoUploadEvent extends UpdateProfileEvent {
  File photoUploaded;

  PhotoUploadEvent(this.photoUploaded);
}

class AddFirstNameEvent extends UpdateProfileEvent {
  String firstName;

  AddFirstNameEvent(this.firstName);
}

class AddEmailEvent extends UpdateProfileEvent {
  String email;

  AddEmailEvent(this.email);
}

class AddPasswordEvent extends UpdateProfileEvent {
  String password;

  AddPasswordEvent(this.password);
}

class AddConfirmPassword extends UpdateProfileEvent {
  String confirmPassword;

  AddConfirmPassword(this.confirmPassword);
}

class AddBirthDateEvent extends UpdateProfileEvent {
  DateTime birthDate;

  AddBirthDateEvent(this.birthDate);
}

class OnPressGoToFamily extends UpdateProfileEvent {}