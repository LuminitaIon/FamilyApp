import 'package:familyapp/screens/add_child/add_child_cubit.dart';
import 'package:familyapp/utils.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:familyapp/widgets/input_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors.dart';
import '../../widgets/custom_date_picker.dart';

List<String> genres = ['boy', 'girl'];

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddChildCubit(),
      child: BlocBuilder<AddChildCubit, AddChildState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                iconSize: 40,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  color: primaryColor,
                ),
              ),
              title: const Center(
                child: Text(
                  "Congtrats! You have a new child!",
                  style: TextStyle(
                      color: primaryColor,
                      fontFamily: "OpenSansSemiBold",
                      fontSize: 20),
                ),
              ),
              backgroundColor: secondaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            foregroundImage:
                                Image.asset("assets/avatar_test.jpg").image,
                            radius: 75,
                          ),
                          Container(
                            height: 40,
                            width: 160,
                            child: ButtonWidget(
                              text: "Upload Picture",
                              onPressed: () {
                                debugPrint("apas");
                              },
                              isSecondary: true,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            flex: 2,
                            child: LabeledInput(
                              label: 'Name',
                              hintText: 'Enter your Name',
                            )),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: ButtonWidget(
                                text: 'Choose name', onPressed: () {})),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Select a gendre',
                      style: TextStyle(
                        fontFamily: 'OpenSansBold',
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    value: state.dropDownValue,
                    items: genres.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (val) {
                      context.read<AddChildCubit>().changeDropDownValue(val);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Select birthdate',
                      style: TextStyle(
                        fontFamily: 'OpenSansBold',
                        color: black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CustomDatePicker(
                    text: initTime,
                    hint: 'What is the birthdate?',
                    onConfirm: (date) {},
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: LabeledInput(
                        label: 'School',
                        hintText: 'Enter your child school (optional)',
                      ),),

                  Padding(
                    padding: const EdgeInsets.only(top: 64.0),
                    child: ButtonWidget(
                      text: "Done",
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
