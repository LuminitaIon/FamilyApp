import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/models/event_model.dart';
import 'package:familyapp/models/events_database.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventState());

  List<EventModel> get parentEvent => state.eventsDatabase.parentsEvents;

  List<EventModel> childEvent(String id) {
    return state.eventsDatabase.childrenEvents[id] ?? [];
  }

  init(String familyId) async {
    emit(state.copyWith(states: EventStates.loading,familyId: familyId));
    final doc = await FirebaseFirestore.instance
        .collection("events")
        .doc(familyId)
        .get();
    emit(state.copyWith(
        states: EventStates.loaded,
        eventsDatabase: EventsDatabase.fromJson(doc.data() ?? {})));
  }

  addEvent(EventModel event, {String? childId}) async {
    EventsDatabase events = state.eventsDatabase;
    if (childId == null) {
      events = events.copyWith(parentsEvents: [...events.parentsEvents, event]);
    } else {
      List<EventModel> childEvents = state.eventsDatabase
          .childrenEvents[childId] ?? [];
      childEvents.add(event);

      events.copyWith(childrenEvents: state.eventsDatabase.childrenEvents
            ..addAll({childId ?? '': childEvents}));
    }
     await FirebaseFirestore.instance
        .collection("events")
          .doc(state.familyID)
          .set(events.toJson());
    emit(state.copyWith(eventsDatabase: events));
  }
}
