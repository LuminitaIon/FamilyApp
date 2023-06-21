import 'package:familyapp/colors.dart';
import 'package:familyapp/family_bloc/family_bloc.dart';
import 'package:familyapp/screens/calendar/calendar_cubit.dart';
import 'package:familyapp/screens/kids/kids_cubit.dart';
import 'package:familyapp/screens/my_profile/my_profile_cubit.dart';
import 'package:familyapp/user_bloc/user_logic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../route_name.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return ListView(
              children: [
                Container(
                  color: secondaryColor,
                  width: MediaQuery.of(context).size.height * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(partenerProfileScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CircleAvatar(
                            foregroundImage: state.user?.imagePath != null
                                 ? Image.network(state.user?.imagePath ?? '').image :
                            Image.asset("assets/avatar_test.jpg").image,
                            radius: 75,
                          ),
                          Text(
                            state.user?.firstName != null ? state.user!.firstName :'Your partener',
                            style: TextStyle(
                              fontFamily: 'OpenSansBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            foregroundImage: AssetImage("assets/avatar_test.jpg"),
                            radius: 75,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'child_name',
                              style: TextStyle(
                                fontFamily: 'OpenSansBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            foregroundImage: AssetImage("assets/avatar_test.jpg"),
                            radius: 75,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'child_name',
                              style: TextStyle(
                                fontFamily: 'OpenSansBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
  }
}
