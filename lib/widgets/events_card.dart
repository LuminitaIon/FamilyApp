import 'package:familyapp/colors.dart';
import 'package:familyapp/models/event_model.dart';
import 'package:familyapp/user_bloc/user_logic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCard extends StatelessWidget {
  final EventModel model;

  const EventCard(
      {Key? key, required this.model,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: TextStyle(
                  fontFamily: 'OpenSansBold',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Locatia: ${model.place}",
                style: TextStyle(
                  fontFamily: 'OpenSansBold',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Data: ${model.date} si ora: ${model.hour}",
                style: TextStyle(
                  fontFamily: 'OpenSansBold',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
