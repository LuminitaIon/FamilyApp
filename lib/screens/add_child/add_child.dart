import 'dart:io';

import 'package:familyapp/family_bloc/family_bloc.dart';
import 'package:familyapp/models/kids_model.dart';
import 'package:familyapp/route_name.dart';
import 'package:familyapp/screens/add_child/add_child_cubit.dart';
import 'package:familyapp/screens/add_child/show_names_cubit.dart';
import 'package:familyapp/screens/collaborate_with_partener/collaborate_with_partener_screen.dart';
import 'package:familyapp/screens/collaborate_with_partener/entering_name_screen.dart';
import 'package:familyapp/screens/kids/kids_cubit.dart';
import 'package:familyapp/utils.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:familyapp/widgets/input_with_label.dart';
import 'package:familyapp/widgets/kids_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:uuid/uuid.dart';

import '../../colors.dart';
import '../../widgets/custom_date_picker.dart';

List<String> genres = ['boy', 'girl'];

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddChildCubit(),
      child: BlocBuilder<AddChildCubit, AddChildState>(
        builder: (context, state) {
          return BlocListener<AddChildCubit, AddChildState>(
            listener: (context, state) {
              if (state.state == AddChildStateScreen.loaded) {
                context.read<FamilyBloc>().add(
                      AddChild(
                        KidsModel(
                            name: state.name,
                            age: DateTime.now().year - state.day.year > 0
                                ? 0
                                : DateTime.now().year - state.day.year,
                            birhDate: state.day,
                            image: state.path,
                            id: Uuid().v4()),
                      ),
                    );
                Navigator.of(context).pop();
              }
            },
            child: Scaffold(
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
                              foregroundImage: state.photo != null
                                  ? Image.file(state.photo!).image
                                  : Image.asset("assets/avatar_test.jpg").image,
                              radius: 75,
                            ),
                            Container(
                              height: 40,
                              width: 160,
                              child: ButtonWidget(
                                text: "Upload Picture",
                                onPressed: () async {
                                  final pickedFile = await ImagePicker()
                                      .pickImage(source: ImageSource.gallery);

                                  if (pickedFile != null) {
                                    final filePath = File(pickedFile.path);
                                    context
                                        .read<AddChildCubit>()
                                        .putFile(filePath);
                                  }
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
                                controller: TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: state.name,
                                    selection: TextSelection.collapsed(
                                        offset: state.name.length),
                                  ),
                                ),
                                label: 'Name',
                                hintText: 'Enter your Name',
                                onChange: (data) {
                                  context
                                      .read<AddChildCubit>()
                                      .changeName(data);
                                },
                              )),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: ButtonWidget(
                              text: 'Choose name',
                              onPressed: () {
                                selectionMethods(context);
                              },
                            ),
                          ),
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
                      decoration: const InputDecoration(
                        focusColor: primaryColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      value: state.dropDownValue,
                      items:
                          genres.map<DropdownMenuItem<String>>((String value) {
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
                      withPadding: false,
                      text: state.day,
                      hint: 'What is the birthdate?',
                      onConfirm: (date) {
                        context.read<AddChildCubit>().selectDate(date);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: LabeledInput(
                        onChange: (data) {
                          context.read<AddChildCubit>().changeSchool(data);
                        },
                        label: 'School',
                        hintText: 'Enter your child school (optional)',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64.0),
                      child: ButtonWidget(
                        text: "Done",
                        onPressed: () {
                          int age = DateTime.now().year - state.day.year;
                          context.read<AddChildCubit>().uploadFile();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void selectionMethods(BuildContext contextGeneral) {
    showModalBottomSheet(
      context: contextGeneral,
      isScrollControlled: true,
      builder: (bottomContext) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Choosing name',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'OpenSansBold',
                    color: primaryColor,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'You can select the name from a list or you can choose together with your partener using our algorithm',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: gray,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ButtonWidget(
                text: 'Collaborate with partener',
                onPressed: () async {
                  await Navigator.push(
                      contextGeneral,
                      MaterialPageRoute(
                          builder: (context) => CollaborateWithPartenerScreen(
                                addCubit: contextGeneral.read<AddChildCubit>(),
                              )));
                  Navigator.pop(contextGeneral);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ButtonWidget(
                  text: 'List of names',
                  isSecondary: true,
                  color: secondaryColor,
                  onPressed: () {
                    Navigator.pop(contextGeneral);
                    showNameList(contextGeneral);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showNameList(BuildContext contextGeneral) {
    final TextEditingController _searchController = TextEditingController();
    showModalBottomSheet(
      context: contextGeneral,
      isScrollControlled: true,
      builder: (bottomContext) {
        return BlocProvider(
          create: (context) => ShowNamesCubit(),
          child: BlocBuilder<ShowNamesCubit, ShowNamesState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      onChanged: (searchedString) {
                        context
                            .read<ShowNamesCubit>()
                            .searchName(searchedString);
                      },
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => _searchController.clear(),
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  ToggleSwitch(
                    minWidth: 180.0,
                    minHeight: 60.0,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    activeFgColor: secondaryColor,
                    inactiveBgColor: secondaryColor,
                    inactiveFgColor: primaryColor,
                    totalSwitches: 2,
                    labels: ['Boy', 'Girl'],
                    icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                    activeBgColors: [
                      [Colors.blue],
                      [Colors.pink]
                    ],
                    onToggle: (index) {
                      context.read<ShowNamesCubit>().changeIndex(index ?? 0);
                    },
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: state.list
                        .map((e) => GestureDetector(
                              onTap: () {
                                debugPrint(e);
                                contextGeneral
                                    .read<AddChildCubit>()
                                    .changeName(e);
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                  e,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'OpenSansSemiBold',
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
