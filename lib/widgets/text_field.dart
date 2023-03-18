import 'package:flutter/material.dart';

import '../colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final String? error;
  final bool isPassword;
  final Function(String) onChange;
  final TextStyle? style;
  final BorderSide? border;

  const TextFieldWidget(
      {Key? key,
      required this.hintText,
      required this.onChange,
      this.error,
        this.border,
      this.isPassword = false,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPadding: const EdgeInsets.only(bottom: 40),
      onChanged: (data) => onChange(data),
      obscureText: isPassword,
      decoration: InputDecoration(
        errorText: error,
        errorStyle: const TextStyle(
          fontFamily: 'OpenSansSemiBold',
        ),
        disabledBorder: border != null ? UnderlineInputBorder(borderSide: border!): UnderlineInputBorder(),
        enabledBorder: border != null ? UnderlineInputBorder(borderSide: border!): UnderlineInputBorder(),
        hintText: hintText,
        hintStyle: style ?? const TextStyle(
          color: hintTextColor,
          fontFamily: 'OpenSansSemiBold',
          fontSize: 20,
        ),
      ),
    );
  }
}
