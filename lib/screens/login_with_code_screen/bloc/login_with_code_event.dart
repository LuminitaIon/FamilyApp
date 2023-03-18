part of 'login_with_code_bloc.dart';

abstract class LoginWithCodeEvent {}

class LoginCodeAddEvent extends LoginWithCodeEvent {
  String code;

  LoginCodeAddEvent(this.code);
}

class ButtonPressedEvent extends LoginWithCodeEvent {}
