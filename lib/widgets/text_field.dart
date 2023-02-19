import 'package:flutter/material.dart';

import '../colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const TextFieldWidget({Key? key, required this.hintText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      scrollPadding: const EdgeInsets.only(bottom: 40),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: hintTextColor,
          fontFamily: 'OpenSansSemiBold',
          fontSize: 20,
        ),
      ),
    );
  }
}
