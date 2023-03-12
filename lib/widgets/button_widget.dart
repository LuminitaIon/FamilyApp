import 'package:familyapp/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPressed;
  final bool isSecondary;
  final bool isEnable;

  ButtonWidget({
    this.color = primaryColor,
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: isEnable ? (){ onPressed();} : null,
        child: Container(
          height: 60,
          width: 278,
          decoration: BoxDecoration(
            color: isEnable ? color : color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
            border: isSecondary
                ? Border.all(
                    color: primaryColor,
                  )
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: isSecondary ? primaryColor : white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
