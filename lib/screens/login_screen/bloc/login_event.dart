part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginAddEmailEvent extends LoginEvent {
  String email;

  LoginAddEmailEvent(this.email);
}

class LoginAddPassword extends LoginEvent {
  String password;

  LoginAddPassword(this.password);
}

class LoginToAccount extends LoginEvent {}
