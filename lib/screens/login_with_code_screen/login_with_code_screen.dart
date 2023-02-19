import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_button.dart';

class LoginWithCodeScreen extends StatelessWidget {
  const LoginWithCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSansBold',
          fontSize: 32,
        ),
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: IconButton(
                iconSize: 40,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 20),
            const Text('Welcome Back!'),
          ],
        ),
      ),
      body: ListView(
        children: [
          Image.asset('assets/family_login.jpg'),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15,
              vertical: 8,
            ),
            child: const TextField(
              scrollPadding: EdgeInsets.only(bottom: 40),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'ENTER CODE',
                hintStyle: TextStyle(
                  color: hintTextColor,
                  fontFamily: 'OpenSansSemiBold',
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.1,
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: ButtonWidget(
              text: 'LOGIN',
              onPressed: () {},
            ),
          ),
          const Spacer(),
          Column(
            children: [
              ButtonText(
                text: 'CREATE A NEW FAMILY GROUP',
                onPressed: () {},
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}