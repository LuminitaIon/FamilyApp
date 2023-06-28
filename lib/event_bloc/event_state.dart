part of 'event_cubit.dart';

class EventState extends Equatable {
  EventStates states;
  EventsDatabase eventsDatabase;
  String familyID;

  EventState(
      {this.states = EventStates.init,
        this.familyID='',
      this.eventsDatabase =
          const EventsDatabase(parentsEvents: [], childrenEvents: {})});

  EventState copyWith({
    EventStates? states,
    String? familyId,
    EventsDatabase? eventsDatabase,
  }) =>
      EventState(
        states: states ?? this.states,
        familyID: familyId ?? this.familyID,
        eventsDatabase: eventsDatabase ?? this.eventsDatabase,
      );

  @override
  List<Object> get props => [states, eventsDatabase];
}

enum EventStates { init, loaded, loading, error }
