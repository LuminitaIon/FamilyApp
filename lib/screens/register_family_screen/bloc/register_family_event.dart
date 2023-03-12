
abstract class RegisterFamilyEvent {}

class RegisterFamilyNameEvent extends RegisterFamilyEvent{
  String data;

  RegisterFamilyNameEvent(this.data);
}

class RegisterEmailEvent extends RegisterFamilyEvent {
  String data;

  RegisterEmailEvent(this.data);
}

class RegisterPasswordEvent extends RegisterFamilyEvent {
  String data;

  RegisterPasswordEvent(this.data);
}

class RegisterConfirmPasswordEvent extends RegisterFamilyEvent {
  String data;

  RegisterConfirmPasswordEvent(this.data);
}