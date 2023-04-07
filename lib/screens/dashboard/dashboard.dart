import 'package:familyapp/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/home_screen.dart';
import 'bloc/dashboard_bloc.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  List<Widget> widgetsBody = [
    HomePage(),
    Container(
      color: Colors.green,
    ),
    Container(color: Colors.amber),
    Container(
      color: Colors.blue,
    ),
  ];

  List<String> titles = [
    "This is your family :)",
    "These are your kids",
    "Your family events",
    "Hi! This is your profile",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: state.index % 2 == 0
                ? FloatingActionButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () {},
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
            ),
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
      ),
    );
  }
}
