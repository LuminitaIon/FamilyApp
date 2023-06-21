import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/models/event_model.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.dart';
int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarState());

  Future<void> init() async {
    emit(state.copyWith(state: CalendarScreenState.loading));
    final result = {
      DateTime(2023, 6, 1): [
        EventModel(
            title: "Gradinita Prezentare",
            place: "Gradinita numarul 5",
            time: DateTime(2023, 6, 1, 10),
            description: "",
            participants: []),
        EventModel(
            title: "Gradinita Prezentare",
            place: "Gradinita numarul 8",
            time: DateTime(2023, 6, 1, 14),
            description: "",
            participants: [])
      ],
      DateTime(2023, 6, 7): [     EventModel(
          title: "Scoala careu",
          place: "Scoala centrala",
          time: DateTime(2023, 6, 7, 10),
          description: "",
          participants: []),
      ],
    };
    emit(state.copyWith(state: CalendarScreenState.loaded, result: LinkedHashMap<DateTime, List<EventModel>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(result)));
  }
  List<EventModel> getEventsForDay(DateTime day) {
    // Implementation example
    return state.result[day] ?? [];
  }

  addEvent(EventModel event){
    List<EventModel> list = state.result[event.time] ??[];
    list.add(event);
    final map = state.result;
    map[event.time] = list;
    emit(state.copyWith(result: map ));
  }

  selectDate(DateTime day) {
    emit(state.copyWith(selectedDay: day));
  }

  selectFocusedDate(DateTime day) {
    emit(state.copyWith(focusedDay: day));
  }
}
