import 'package:familyapp/colors.dart';
import 'package:familyapp/event_bloc/event_cubit.dart';
import 'package:familyapp/family_bloc/family_bloc.dart';
import 'package:familyapp/models/event_model.dart';
import 'package:familyapp/models/events_database.dart';
import 'package:familyapp/route_name.dart';
import 'package:familyapp/screens/add_child/add_child.dart';
import 'package:familyapp/screens/calendar/calendar_cubit.dart';
import 'package:familyapp/screens/calendar/calendar_screen.dart';
import 'package:familyapp/screens/dashboard/bloc/add_event_cubit.dart';
import 'package:familyapp/screens/home/bloc/home_bloc.dart';
import 'package:familyapp/screens/kids/kids_cubit.dart';
import 'package:familyapp/screens/kids/kids_screen.dart';
import 'package:familyapp/screens/my_profile/my_profile_cubit.dart';
import 'package:familyapp/screens/my_profile/my_profile_screen.dart';
import 'package:familyapp/user_bloc/user_logic_bloc.dart';
import 'package:familyapp/utils.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:familyapp/widgets/custom_date_picker.dart';
import 'package:familyapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../home/home_screen.dart';
import 'bloc/dashboard_bloc.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  List<Widget> widgetsBody = [
    HomePage(),
    KidsScreen(),
    CalendarScreen(),
    MyProfileScreen(),
  ];

  List<String> titles = [
    "This is your family :)",
    "These are your kids",
    "Your family events",
    "Hi! This is your profile",
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashboardBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc()
            ..getData(context.read<FamilyBloc>().state.family,
                context.read<UserLogicBloc>().state.user.id),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => MyProfileCubit()..init(),
        ),
      ],
      child: BlocBuilder<FamilyBloc, FamilyState>(
        builder: (contextFamily, stateFamily) {
          return BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              context
                  .read<EventCubit>()
                  .init(context.read<FamilyBloc>().state.family.id);
              return Scaffold(
                resizeToAvoidBottomInset: true,
                floatingActionButton: state.index % 2 == 0
                    ? FloatingActionButton(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 24),
                        ),
                        onPressed: () {
                          if (state.index == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (buildContext) =>
                                        AddChildScreen()));
                          } else if (state.index == 2) {
                            createEvent(context);
                          }
                        },
                        backgroundColor: primaryColor,
                      )
                    : null,
                appBar: AppBar(
                    leading: Container(),
                    title: Text(
                      titles[state.index],
                      style: TextStyle(color: primaryColor),
                    ),
                    backgroundColor: secondaryColor,
                    centerTitle: true,
                    actions: state.index == 3
                        ? [
                            Padding(
                              padding: const EdgeInsets.only(right: 32.0),
                              child: GestureDetector(
                                child: Icon(
                                  Icons.logout,
                                  color: primaryColor,
                                ),
                                onTap: () {
                                  print("ceva");
                                  context
                                      .read<UserLogicBloc>()
                                      .add(LogoutEvent());
                                  context.read<FamilyBloc>().add(ReinitializeFamily());
                                  Navigator.popUntil(context, (route) => route.settings.name == splashScreen);
                                  Navigator.pushNamed(context, welcomeScreen);
                                },
                              ),
                            )
                          ]
                        : null),
                body: widgetsBody[state.index],
                bottomNavigationBar: BottomNavigationBar(
                  iconSize: 36.0,
                  backgroundColor: secondaryColor,
                  items: const [
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(
                        Icons.home,
                        color: primaryColor,
                      ),
                      activeIcon: Icon(
                        Icons.home,
                        color: primaryColor,
                        shadows: [
                          Shadow(color: gray, blurRadius: 10.0),
                        ],
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(
                        Icons.people,
                        color: primaryColor,
                      ),
                      activeIcon: Icon(
                        Icons.people,
                        color: primaryColor,
                        shadows: [
                          Shadow(color: gray, blurRadius: 10.0),
                        ],
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                      ),
                      activeIcon: Icon(
                        Icons.calendar_month,
                        color: primaryColor,
                        shadows: [
                          Shadow(color: gray, blurRadius: 10.0),
                        ],
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(
                        Icons.person,
                        color: primaryColor,
                      ),
                      activeIcon: Icon(
                        Icons.person,
                        color: primaryColor,
                        shadows: [
                          Shadow(color: gray, blurRadius: 50.0),
                        ],
                      ),
                    ),
                  ],
                  currentIndex: state.index,
                  onTap: (index) {
                    context.read<DashboardBloc>().add(DashboardEvent(index));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void createEvent(BuildContext contextGeneral) {
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
                        text: !isSameDay(state.time, initTime)
                            ? state.time
                            : null,
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
                          contextGeneral.read<EventCubit>().addEvent(EventModel(
                                title: state.title,
                                place: state.palce,
                                time: state.time,
                                description: state.description,
                              ));
                          Navigator.of(context).pop();
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
