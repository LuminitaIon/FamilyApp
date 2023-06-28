import 'package:familyapp/event_bloc/event_cubit.dart';
import 'package:familyapp/family_bloc/family_bloc.dart';
import 'package:familyapp/models/event_model.dart';
import 'package:familyapp/screens/dashboard/bloc/add_event_cubit.dart';
import 'package:familyapp/utils.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:familyapp/widgets/custom_date_picker.dart';
import 'package:familyapp/widgets/events_card.dart';
import 'package:familyapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../colors.dart';

class ChildProfile extends StatefulWidget {
  EventCubit bloc;
  String id;
  FamilyBloc familyBloc;

  ChildProfile({Key? key,
    required this.bloc,
    required this.id,
    required this.familyBloc})
      : super(key: key);

  @override
  State<ChildProfile> createState() => _ChildProfileState();
}

class _ChildProfileState extends State<ChildProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyBloc, FamilyState>(
      builder: (context, state) {
        final child =
        state.family.children.firstWhere((element) => element.id == widget.id);
        return BlocBuilder<EventCubit, EventState>(
          builder: (contextEvent, stateEvent) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  iconSize: 40,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    color: primaryColor,
                  ),
                ),
                title:  Center(
                  child: Text(
                    "Hi, I am ${child.name}!",
                    style: const TextStyle(
                        color: primaryColor,
                        fontFamily: "OpenSansSemiBold",
                        fontSize: 24),
                  ),
                ),
                backgroundColor: secondaryColor,
              ),
              floatingActionButton: FloatingActionButton(
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  createEvent(contextEvent, child.id);
                },
                backgroundColor: primaryColor,
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          foregroundImage: child.image?.isNotEmpty == true ? Image.network(
                              child.image ?? "").image : AssetImage("assets/avatar_test.jpg"),
                          radius: 75,
                        ),
                        Column(
                          children: [
                            Text(
                              "${child.name}",
                              style: TextStyle(
                                fontFamily: "OpenSansBold",
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "My birthday: ${DateFormat("dd.MM.yyyy").format( child.birhDate)}",
                              style: TextStyle(
                                fontFamily: "OpenSansSemiBold",
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Evenimente",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'OpenSansBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    ...stateEvent.eventsDatabase.childrenEvents[child.id] ==
                        null
                        ? []
                        : stateEvent.eventsDatabase.childrenEvents[child
                        .id]!
                        .map((e) => EventCard(model: e))
                        .toList()
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void createEvent(BuildContext contextGeneral, String id) {
    showModalBottomSheet(
        context: contextGeneral,
        isScrollControlled: true,
        builder: (bottomContext) {
          return BlocProvider(
            create: (context) => AddEventCubit(),
            child: BlocBuilder<AddEventCubit, AddEventState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFieldlWithBorderWidget(
                          border: const BorderSide(color: primaryColor),
                          style: const TextStyle(
                            color: primaryColor,
                            fontFamily: 'OpenSansSemiBold',
                            fontSize: 12,
                          ),
                          hintText: 'Title',
                          onChange: (data) {
                            context.read<AddEventCubit>().changeTitle(data);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFieldlWithBorderWidget(
                          border: const BorderSide(color: primaryColor),
                          style: const TextStyle(
                            color: primaryColor,
                            fontFamily: 'OpenSansSemiBold',
                            fontSize: 12,
                          ),
                          hintText: 'Description',
                          onChange: (data) {
                            context
                                .read<AddEventCubit>()
                                .changeDescription(data);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFieldlWithBorderWidget(
                          border: const BorderSide(color: primaryColor),
                          style: const TextStyle(
                            color: primaryColor,
                            fontFamily: 'OpenSansSemiBold',
                            fontSize: 12,
                          ),
                          hintText: 'Place',
                          onChange: (data) {
                            context.read<AddEventCubit>().changePlace(data);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomDatePicker(
                        max: DateTime(2050),
                        text:
                        !isSameDay(state.time, initTime) ? state.time : null,
                        hint: 'Date',
                        onConfirm: (date) {
                          context.read<AddEventCubit>().changeDate(date);
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ButtonWidget(
                        text: 'Save',
                        onPressed: () {
                          Navigator.of(context).pop();

                          contextGeneral.read<EventCubit>().addEvent(EventModel(
                            title: state.title,
                            place: state.palce,
                            time: state.time,
                            description: state.description,
                          ), childId: id);
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ButtonWidget(
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        isSecondary: true,
                        color: secondaryColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
