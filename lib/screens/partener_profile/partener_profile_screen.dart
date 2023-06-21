import 'package:familyapp/widgets/text_button.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../widgets/button_widget.dart';

class PartenerProfile extends StatelessWidget {
  const PartenerProfile({Key? key}) : super(key: key);

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
            "Hi, my beloved!",
            style: TextStyle(
                color: primaryColor,
                fontFamily: "OpenSansSemiBold",
                fontSize: 24),
          ),
        ),
        backgroundColor: secondaryColor,
      ),
      body: ListView(
        children: [
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                foregroundImage: Image.asset("assets/avatar_test.jpg").image,
                radius: 75,
              ),
              Column(
                children: [
                  Text(
                    "partener_name",
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
          
        ],
      ),
    );
  }
}
