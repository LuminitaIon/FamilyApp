import 'package:familyapp/colors.dart';
import 'package:familyapp/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LabeledInput extends StatelessWidget {
  LabeledInput({Key? key, required this.label, required this.hintText,this.controller, required this.onChange}) : super(key: key);
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)onChange;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'OpenSansBold',
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextFieldlWithBorderWidget(hintText: hintText, onChange: (data ) => onChange(data),controller: controller,),
      ],
    );
  }
}
