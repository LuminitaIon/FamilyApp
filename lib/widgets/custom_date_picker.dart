import 'package:familyapp/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import 'date_picker_button.dart';

class CustomDatePicker extends StatelessWidget {
  DateTime? text;
  String hint;
  bool isRequired;
  String? error;
  Function(DateTime) onConfirm;

  CustomDatePicker({
    Key? key,
    required this.hint,
    required this.onConfirm,
    this.text,
    this.isRequired = false,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime(1900, 3, 5),
            maxTime: DateTime.now(),
            onChanged: (date) {
              print('change $date');
            },
            onConfirm: (date) =>
                onConfirm(date),
            currentTime: DateTime.now(),
            locale: LocaleType.en);
      },
      child: Column(
        children: [
         DatePickerButton(
            color: error == null ? primaryColor : Colors.amber,
            text: text != null ? DateFormat('dd.MM.yyyy').format(text!) : hint,
          ),
          if(error != null)
            Text(error!, style: TextStyle(fontSize: 12, color: Colors.amber),)
        ],
      ),
    );
  }
}
