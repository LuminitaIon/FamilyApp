import 'package:familyapp/event_bloc/event_cubit.dart';
import 'package:familyapp/screens/my_profile/my_profile_cubit.dart';
import 'package:familyapp/user_bloc/user_logic_bloc.dart';
import 'package:familyapp/widgets/events_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyProfileCubit, MyProfileState>(
      builder: (context, state) {
        return BlocBuilder<EventCubit, EventState>(
          builder: (contextEvent, stateEvent) {
            return BlocBuilder<UserLogicBloc, UserLogicState>(
              builder: (contextUser, userState) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                      children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CircleAvatar(
                                  foregroundImage: userState.user.imagePath !=
                                          null
                                      ? Image.network(
                                              userState.user?.imagePath ?? '')
                                          .image
                                      : Image.asset("assets/avatar_test.jpg")
                                          .image,
                                  radius: 75,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Text(
                                    "Ziua mea de nastere este\n${DateFormat("dd-MM-yyyy").format(userState.user.birthDate)}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'OpenSansBold',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
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
                          ] +
                          stateEvent.eventsDatabase.parentsEvents
                              .map((e) => EventCard(model: e))
                              .toList()),
                );
              },
            );
          },
        );
      },
    );
  }
}
