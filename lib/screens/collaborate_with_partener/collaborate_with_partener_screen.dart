import 'package:familyapp/screens/add_child/add_child_cubit.dart';
import 'package:familyapp/screens/collaborate_with_partener/entering_name_screen.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors.dart';
import '../../route_name.dart';

class CollaborateWithPartenerScreen extends StatelessWidget {
  final AddChildCubit addCubit;
  const CollaborateWithPartenerScreen({Key? key, required this.addCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            "Choose a name with me!",
            style: TextStyle(
                color: primaryColor,
                fontFamily: "OpenSansSemiBold",
                fontSize: 20),
          ),
        ),
        backgroundColor: secondaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 32.0, left: 24.0, right: 24.0, bottom: 64.0),
            child: Text(
              'Hello! I am happy to come to this family! I wonder what name will you choose for me. Please invite your partener to help you decide my name! I know that you make a great team and together you will choose the perfect name for me ',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontFamily: 'OpenSans', fontSize: 24, color: gray),
            ),
          ),
          ButtonWidget(
            text: 'Send invite',
            onPressed: () async{
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EnteringNameScreen(
                        addCubit: addCubit,
                      )));
              Navigator.pop(context );
            },
          ),
          // SizedBox(
          //   height: 16,
          // ),
          // ButtonWidget(
          //   text: 'Send email',
          //   onPressed: () {},
          //   isSecondary: true,
          //   color: secondaryColor,
          // ),
        ],
      ),
    );
  }
}
