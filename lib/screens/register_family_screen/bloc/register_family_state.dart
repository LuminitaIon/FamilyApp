import 'package:equatable/equatable.dart';

class RegisterFamilyState extends Equatable {
  String familyName;
  String email;
  String password;
  String confirmPassword;
  String? errorFamilyName;
  String? errorEmail;
  String? errorPassword;
  String? errorConfirmPassword;
  RegisterStates? states;

  bool get enableButton =>
      familyName.isNotEmpty &&
      errorFamilyName == null &&
      email.isNotEmpty &&
      errorEmail == null &&
      password.isNotEmpty &&
      errorPassword == null &&
      confirmPassword.isNotEmpty &&
      errorConfirmPassword == null;

  RegisterFamilyState({
    this.familyName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.errorFamilyName,
    this.errorEmail,
    this.errorPassword,
    this.errorConfirmPassword,
    this.states = RegisterStates.loaded,
  });

  RegisterFamilyState copyWith({
    String? familyName,
    String? email,
    String? password,
    String? confirmPassword,
    String? errorFamilyName,
    String? errorEmail,
    String? errorPassword,
    String? errorConfirmPassword,
    RegisterStates? states,
  }) =>
      RegisterFamilyState(
        familyName: familyName ?? this.familyName,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        states: states ?? this.states,
        errorFamilyName: errorFamilyName != null
            ? (errorFamilyName.isNotEmpty ? errorFamilyName : null)
            : this.errorFamilyName,
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
  List<Object?> get props => [
        familyName,
        email,
        password,
        confirmPassword,
      ];
}

enum RegisterStates {loaded, loading}