import 'package:flutter/material.dart';

import '../colors.dart';

class DatePickerButton extends StatelessWidget {
  final String text;
  final Color? color;

  const DatePickerButton({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color ?? primaryColor),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0),
              child: Text(
                text,
                style: const TextStyle(
                  color: primaryColor,
                  fontFamily: "OpenSansSemiBold",
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: const Icon(
                Icons.calendar_month_outlined,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
