part of 'calendar_cubit.dart';

enum CalendarScreenState {
  init,
  loading,
  loaded,
}

class CalendarState extends Equatable {
  final CalendarScreenState state;
  final Map<DateTime,List<EventModel>> result;
  late final DateTime selectedDay;
  late final DateTime focusedDay;

   CalendarState({
    this.state = CalendarScreenState.init,
    this.result = const {},
     DateTime? day,
     DateTime? focused
  }){
     selectedDay = day ?? DateTime.now();

     focusedDay = focused ?? DateTime.now();
   }

  CalendarState copyWith({
    CalendarScreenState? state,
    Map<DateTime,List<EventModel>>? result,
    DateTime? selectedDay,
    DateTime? focusedDay
  }) =>
      CalendarState(state: state ?? this.state, result: result ?? this.result,day: selectedDay??this.selectedDay, focused:focusedDay?? this.focusedDay);

  @override
  List<Object> get props => [state, result,selectedDay,focusedDay];
}
