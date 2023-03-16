import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../utils.dart';

class RegisterProfileState extends Equatable {
  RegisterProfileStates states;
  String firstName;
  DateTime birthDate;
  DateTime weddingDate;
  DateTime firstMeetingDate;
  File? photo;

  bool get enableButton => birthDate.year != initTime.year ? true : false;

  RegisterProfileState(
      {this.states = RegisterProfileStates.init,
      this.firstName = '',
      DateTime? birthDateTime,
      DateTime? weddingDateTime,
      DateTime? firstMeetingDateTime,
      this.photo})
      : birthDate = birthDateTime ?? initTime,
        weddingDate = weddingDateTime ?? initTime,
        firstMeetingDate = firstMeetingDateTime ?? initTime;

  RegisterProfileState copyWith(
          {RegisterProfileStates? states,
          DateTime? birthDate,
          DateTime? weddingDate,
          DateTime? firstMeetingDate,
          String? firstName,
          File? photo}) =>
      RegisterProfileState(
        states: states ?? this.states,
        birthDateTime: birthDate ?? this.birthDate,
        weddingDateTime: weddingDate ?? this.weddingDate,
        firstMeetingDateTime: firstMeetingDate ?? this.firstMeetingDate,
        firstName: firstName ?? this.firstName,
        photo: photo ?? this.photo
      );

  @override
  List<Object?> get props => [birthDate, weddingDate, firstMeetingDate, states,firstName, photo];
}

enum RegisterProfileStates { init, loading, succes, error }
