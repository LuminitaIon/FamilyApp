import 'package:familyapp/colors.dart';
import 'package:familyapp/event_bloc/event_cubit.dart';
import 'package:familyapp/screens/calendar/calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../widgets/events_card.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime focusedDay;

  @override
  void initState() {
    focusedDay = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => CalendarCubit()..init(state.eventsDatabase),
          child: BlocBuilder<CalendarCubit, CalendarState>(
            builder: (context, state) {
              return BlocListener<EventCubit, EventState>(
                listener: (contextListener, stateLisner) {
                  context
                      .read<CalendarCubit>()
                      .init(stateLisner.eventsDatabase);
                },
                child: Column(
                  children: [
                    TableCalendar(
                      firstDay: DateTime(DateTime.now().year - 10),
                      lastDay: DateTime(DateTime.now().year + 10),
                      focusedDay: focusedDay,
                     availableCalendarFormats : const {CalendarFormat.month : 'Month'},
                      calendarStyle: const CalendarStyle(
                        selectedTextStyle: TextStyle(color: Colors.white),
                        isTodayHighlighted: true,
                        markerDecoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      eventLoader:
                          context.read<CalendarCubit>().getEventsForDay,
                      calendarFormat: CalendarFormat.month,
                      selectedDayPredicate: (day) {
                        return isSameDay(state.selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(state.selectedDay, selectedDay)) {
                          // Call `setState()` when updating the selected day
                          context.read<CalendarCubit>().selectDate(selectedDay);
                          context
                              .read<CalendarCubit>()
                              .selectFocusedDate(focusedDay);
                          this.focusedDay = focusedDay;
                        }
                      },
                      onPageChanged: (focusedDay) {
                        // No need to call `setState()` here
                        this.focusedDay = focusedDay;
                      },
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: _buildEventList(state, context),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildEventList(CalendarState state, BuildContext context) {
    final events =
        context.read<CalendarCubit>().getEventsForDay(state.selectedDay);
    if (events == null || events.isEmpty) {
      return Center(
        child: Text('Nici un eveniment de prezentat'),
      );
    }

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventCard(
          model: events[index],
        );
      },
    );
  }
}
