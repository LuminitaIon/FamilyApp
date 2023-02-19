import 'package:familyapp/colors.dart';
import 'package:flutter/widgets.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonText({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: primaryColor, fontFamily: "OpenSansSemiBold", fontSize: 16, ),
              
            ),
          ),
        ),
      ),
    );
  }
}
