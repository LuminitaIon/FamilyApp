import 'package:familyapp/widgets/text_button.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class IconText extends StatelessWidget {
  Function onPressed;

  IconText({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed(),
      child:  Container(
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: primaryColor,
          ),

        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.edit_outlined),
              SizedBox(width: 8,),
              ButtonText(text: 'Upload Photo', onPressed: onPressed),
            ],
          ),
        ),)
    );
  }
}
