import 'package:flutter/material.dart';

import '../colors.dart';

class DatePickerButton extends StatelessWidget {
  final String text;
  final Color? color;
  final bool withPadding;

  const DatePickerButton({Key? key, required this.text, this.color, this.withPadding = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.only(left: withPadding ? 10.0 : 0.0, right: withPadding ? 10.0: 0.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color ?? primaryColor),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: primaryColor,
                    fontFamily: "OpenSansSemiBold",
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Spacer(flex: 2,),
            Expanded(
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
