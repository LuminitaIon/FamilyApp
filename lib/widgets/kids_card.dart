import 'package:familyapp/models/kids_model.dart';
import 'package:familyapp/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../event_bloc/event_cubit.dart';
import '../family_bloc/family_bloc.dart';
import '../screens/child_profile/child_profile_screen.dart';

class KidsCard extends StatelessWidget {
  final KidsModel model;

  const KidsCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () { Navigator.push(
          context,
          MaterialPageRoute(
            builder: (buildContext) =>
                ChildProfile(
                  id: model.id,
                  bloc: context
                      .read<EventCubit>(), familyBloc: context.read<FamilyBloc>(),
             
                ),
          ));},
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              foregroundImage: model.image?.isNotEmpty == true ? Image.network(
                  model.image ?? "").image : AssetImage("assets/avatar_test.jpg"),
              radius: 45,
            ),
            SizedBox(width: 40,),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${calculateAge(model.birhDate)}',
                    style: TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  if(model.school != null)
                  Text(
                    model.school??'',
                    style: TextStyle(
                      fontFamily: 'OpenSansBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                ],
              ),

            ),

          ],
        ),
      ),
    );
  }

  String calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }
}