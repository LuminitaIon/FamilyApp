import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/models/event_model.dart';
import 'package:familyapp/models/events_database.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.dart';

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarState());

  Future<void> init(EventsDatabase events) async {
    emit(state.copyWith(state: CalendarScreenState.loading));
    final result = <DateTime, List<EventModel>>{};
    final parentEvents = events.parentsEvents;
    parentEvents.forEach((element) {
      List<EventModel> list = result[element.time] ?? [];
      result[element.time] = [...list, element];
    });
    final childEvents = events.childrenEvents;
    childEvents.values.forEach((element) {
      element.forEach((elementModel) {
        List<EventModel> list = result[elementModel.time] ?? [];
        result[elementModel.time] = [...list, elementModel];
      });
    });

    emit(state.copyWith(
        state: CalendarScreenState.loaded,
        result: LinkedHashMap<DateTime, List<EventModel>>(
          equals: isSameDay,
          hashCode: getHashCode,
        )..addAll(result)));
  }

  List<EventModel> getEventsForDay(DateTime day) {
    // Implementation example
    return state.result[day] ?? [];
  }

  addEvent(EventModel event) {
    List<EventModel> list = state.result[event.time] ?? [];
    list.add(event);
    final map = state.result;
    map[event.time] = list;
    emit(state.copyWith(result: map));
  }

  selectDate(DateTime day) {
    emit(state.copyWith(selectedDay: day));
  }

  selectFocusedDate(DateTime day) {
    emit(state.copyWith(focusedDay: day));
  }
}
