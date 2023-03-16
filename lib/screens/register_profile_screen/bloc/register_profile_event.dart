
import 'dart:io';

abstract class RegisterProfileEvent {}

class DateBirthEvent extends RegisterProfileEvent {
  DateTime birthDate;

  DateBirthEvent(this.birthDate);
}

class MarriageDateEvent extends RegisterProfileEvent {
  DateTime marriageDate;

  MarriageDateEvent(this.marriageDate);
}

class FirstMeetingEvent extends RegisterProfileEvent {
  DateTime firstMeetingDate;

  FirstMeetingEvent(this.firstMeetingDate);
}

class GoToYourFamilyEvent extends RegisterProfileEvent {

}

class FirstNameEvent extends RegisterProfileEvent {
  String data;

  FirstNameEvent(this.data);
}

class UploadPhotoEvent extends RegisterProfileEvent {
  File photoUploaded;

  UploadPhotoEvent(this.photoUploaded);
}