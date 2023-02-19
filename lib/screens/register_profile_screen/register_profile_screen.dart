import 'package:flutter/material.dart';

import '../../colors.dart';

class RegisterProfileScreen extends StatelessWidget {
  const RegisterProfileScreen({super.key});

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
        title: Container(
          child: Row(
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
                  'Create your profile',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 75,
              foregroundImage: AssetImage("assets/avatar_test.jpg"),
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSansBold',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            scrollPadding: EdgeInsets.only(bottom: 40),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your name here',
              hintStyle: TextStyle(
                color: hintTextColor,
                fontFamily: 'OpenSansBold',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          
        ],
      ),
    );
  }
}
