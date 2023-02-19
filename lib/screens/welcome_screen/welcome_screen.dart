import 'package:familyapp/colors.dart';
import 'package:familyapp/route_name.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Image.asset('assets/login_page_photo.jpg'),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: secondaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  ButtonWidget(
                    text: "LOGIN",
                    onPressed: () {
                      Navigator.of(context).pushNamed(loginPageWithEmailScreen);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ButtonWidget(
                    text: "ENTER WITH A FAMILY CODE",
                    color: white,
                    onPressed: () {
                      Navigator.of(context).pushNamed(loginWithCodeScreen);
                    },
                    isSecondary: true,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  const Text(
                    "DON'T HAVE A FAMILY GROUP YET?",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 17,
                    ),
                  ),
                  ButtonText(
                    text: "REGISTER A FAMILY",
                    onPressed: () {
                      Navigator.of(context).pushNamed(registerFamilyScreen);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
