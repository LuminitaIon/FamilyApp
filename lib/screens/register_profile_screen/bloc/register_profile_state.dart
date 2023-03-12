import 'package:equatable/equatable.dart';

import '../../../utils.dart';

class RegisterProfileState extends Equatable {
  RegisterProfileStates states;
  DateTime birthDate;
  DateTime weddingDate;
  DateTime firstMeetingDate;

  bool get enableButton => birthDate.year != initTime.year ? true : false;

  RegisterProfileState({this.states = RegisterProfileStates.init,
    DateTime? birthDateTime,
    DateTime? weddingDateTime,
    DateTime? firstMeetingDateTime})
      : birthDate = birthDateTime ?? initTime,
        weddingDate = weddingDateTime ?? initTime,
        firstMeetingDate = firstMeetingDateTime ?? initTime;

  RegisterProfileState copyWith({RegisterProfileStates? states,
    DateTime? birthDate,
    DateTime? weddingDate,
    DateTime? firstMeetingDate}) => RegisterProfileState(
    states: states ?? this.states,
    birthDateTime: birthDate ?? this.birthDate,
    weddingDateTime: weddingDate ?? this.weddingDate,
    firstMeetingDateTime: firstMeetingDate ?? this.firstMeetingDate,
  );

  @override
  List<Object?> get props => [birthDate, weddingDate, firstMeetingDate, states];


}

enum RegisterProfileStates { init, loading, succes, error }
