import 'package:familyapp/colors.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Image.asset('assets/login_page_photo.jpg'),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: secondaryColor,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ButtonWidget(text: "LOGIN", onPressed: () {print("login");},),
                    ButtonWidget(
                      text: "ENTER WITH A FAMILY CODE",
                      color: white,
                      onPressed: () {print("family code");},
                      isSecondary: true,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text("Don’t have a family group yet?"),
                    ButtonText(
                      text: "Register a family",
                      onPressed: () {print("register");},
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
