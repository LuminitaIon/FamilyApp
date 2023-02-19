import 'package:familyapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../route_name.dart';
import '../../widgets/text_field.dart';

class RegisterFamilyScreen extends StatelessWidget {
  final TextEditingController familyNameController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController passwordRegisterController = TextEditingController();
  final TextEditingController confirmPasswordRegisterController = TextEditingController();
  RegisterFamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
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
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Create your family group',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Image.asset("assets/register_family.jpg"),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15,
              vertical: 8,
            ),
            child: TextFieldWidget(
              hintText: 'Family Name',
              controller: familyNameController,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15,
              vertical: 8,
            ),
            child: TextFieldWidget(
              hintText: 'Email',
              controller: emailRegisterController,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15,
              vertical: 8,
            ),
            child: TextFieldWidget(
              hintText: 'Password',
              controller: passwordRegisterController,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15,
              vertical: 8,
            ),
            child: TextFieldWidget(
              hintText: 'Confirm Password',
              controller: confirmPasswordRegisterController,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Column(
            children: [
              ButtonWidget(
                text: 'CREATE YOUR ACCOUNT',
                onPressed: () {
                  Navigator.of(context).pushNamed(registerProfileScreen);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              ButtonWidget(
                color: secondaryColor,
                text: 'GO BACK',
                isSecondary: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          )
        ],
      ),
    );
  }
}
