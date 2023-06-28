import 'package:familyapp/event_bloc/event_cubit.dart';
import 'package:familyapp/screens/home/bloc/home_bloc.dart';
import 'package:familyapp/user_bloc/user_logic_bloc.dart';
import 'package:familyapp/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/events_card.dart';

class PartenerProfile extends StatelessWidget {
  final EventCubit bloc;
  final HomeBloc homeBloc;
  const PartenerProfile({Key? key, required this.bloc,required this.homeBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
  builder: (contextUser, stateUser) {
    return BlocBuilder<EventCubit, EventState>(
      bloc: bloc,
      builder: (context, state) {
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
              title: const Center(
                child: Text(
                  "Hi, my beloved!",
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: "OpenSansSemiBold",
                      fontSize: 24),
                ),
              ),
              backgroundColor: secondaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(children: <Widget>[
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      foregroundImage: stateUser.user?.imagePath != null
                          ? Image.network(stateUser.user?.imagePath ?? '').image
                          : Image.asset("assets/avatar_test.jpg").image,
                      radius: 75,
                    ),
                    Column(
                      children: [
                        Text(
                          "${stateUser.user?.firstName}",
                          style: TextStyle(
                            fontFamily: "OpenSansBold",
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "My birthday: ${'1.2.1998'}",
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
              ] + state.eventsDatabase.parentsEvents.map((e) => EventCard(model :e)).toList()
              ),
            ));
      },
    );
  },
);
  }
}
