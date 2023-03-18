part of 'update_profile_bloc.dart';

class UpdateProfileState extends Equatable {
  File? photo;
  String firstName;
  String email;
  String password;
  String confirmPassword;
  DateTime birthDate;
  UpdateProfileStates? state;
  String? errorEmail;
  String? errorPassword;
  String? errorConfirmPassword;

  bool get enableButton =>
      firstName.isNotEmpty &&
      email.isNotEmpty &&
      errorEmail == null &&
      password.isNotEmpty &&
      errorPassword == null &&
      confirmPassword.isNotEmpty &&
      errorConfirmPassword == null &&
      birthDate.year != initTime.year;

  UpdateProfileState({
    this.photo,
    this.firstName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    DateTime? birthDateTime,
    this.state = UpdateProfileStates.init,
    this.errorEmail,
    this.errorPassword,
    this.errorConfirmPassword,
  }) : birthDate = birthDateTime ?? initTime;

  UpdateProfileState copyWith(
          {File? photo,
          String? firstName,
          String? email,
          String? password,
          String? confirmPassword,
          DateTime? birthDate,
          UpdateProfileStates? state,
          String? errorEmail,
          String? errorPassword,
          String? errorConfirmPassword}) =>
      UpdateProfileState(
        photo: photo ?? this.photo,
        firstName: firstName ?? this.firstName,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        birthDateTime: birthDate ?? this.birthDate,
        state: state ?? this.state,
        errorEmail: errorEmail != null
            ? (errorEmail.isNotEmpty ? errorEmail : null)
            : this.errorEmail,
        errorPassword: errorPassword != null
            ? (errorPassword.isNotEmpty ? errorPassword : null)
            : this.errorPassword,
        errorConfirmPassword: errorConfirmPassword != null
            ? (errorConfirmPassword.isNotEmpty ? errorConfirmPassword : null)
            : this.errorConfirmPassword,
      );

  @override
  List<Object?> get props =>
      [photo, firstName, email, password, confirmPassword, birthDate];
}

enum UpdateProfileStates { init, loading, success, error }
