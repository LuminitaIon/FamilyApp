part of 'add_event_cubit.dart';

class AddEventState extends Equatable {
  final String title;
  final String palce;
  final String description;
  DateTime time;

  AddEventState({
    this.title = '',
    this.description = '',
    this.palce = '',
    DateTime? timeOF,
  }) : time = timeOF ?? initTime;

  AddEventState copyWith({
    String? title,
    String? description,
    String? palce,
    DateTime? time,
})=> AddEventState(
    title: title ?? this.title,
    palce: palce ?? this.palce,
    description: description ?? this.description,
    timeOF: time ?? this.time,
  );

  @override
  List<Object> get props => [title,description,time,palce];
}
