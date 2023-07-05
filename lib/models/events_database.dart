import 'package:flutter/material.dart';

import 'event_model.dart';

class EventsDatabase {
  final List<EventModel> parentsEvents;
  final Map<String, List<EventModel>> childrenEvents;

  const EventsDatabase(
      {required this.parentsEvents, required this.childrenEvents});

  EventsDatabase copyWith({List<EventModel>? parentsEvents,
    Map<String, List<EventModel>>? childrenEvents}) =>
      EventsDatabase(
        parentsEvents: parentsEvents ?? this.parentsEvents,
        childrenEvents: childrenEvents ?? this.childrenEvents,
      );

  static EventsDatabase fromJson(Map<String, dynamic> json) =>
      EventsDatabase(parentsEvents: (json["parents_event"] as List?)
          ?.map((e) => EventModel.fromJson(e))
          .toList() ?? [],
          childrenEvents:getMapFrom(json["children_event"]) ?? {});

  static Map<String, List<EventModel>> getMapFrom(Map<String,dynamic>? json){
    Map<String, List<EventModel>> maps ={};
    json?.forEach((key, value) {
      maps[key] = (value as List?)?.map((e) => EventModel.fromJson(e)).toList() ?? [];
    },);
    return maps;
  }

  Map<String, dynamic>  toJson() =>{
    "parents_event":  parentsEvents.map((e) => e.toJson()),
    "children_event":  createToMap(childrenEvents),
  };

  Map<String, dynamic> createToMap(Map<String, List<EventModel>> childrenEvents) {
    Map<String, dynamic> maps ={};
    childrenEvents.forEach((key, value) {
      maps[key] = value.map((e) => e.toJson()).toList();
    },);
    return maps;
  }


}
