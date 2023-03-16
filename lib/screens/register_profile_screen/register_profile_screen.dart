import 'dart:io';

import 'package:familyapp/screens/register_profile_screen/bloc/register_profile_bloc.dart';
import 'package:familyapp/screens/register_profile_screen/bloc/register_profile_event.dart';
import 'package:familyapp/user_bloc/user_logic_bloc.dart';
import 'package:familyapp/widgets/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../colors.dart';
import '../../family_bloc/family_bloc.dart';
import '../../route_name.dart';
import '../../utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/icon_text_button.dart';
import '../../widgets/text_button.dart';
import 'bloc/register_profile_state.dart';

class RegisterProfileScreen extends StatelessWidget {
  const RegisterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSansBold',
          fontSize: 32,
        ),
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: IconButton(
                  iconSize: 40,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Create your profile',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => RegisterProfileBloc(),
        child: BlocListener<FamilyBloc, FamilyState>(
          listener: (context, state) {
            if (state.states == FamilyStates.loaded) {
              Navigator.of(context).pushNamed(dashboardScreen);
            }
          },
          child: BlocBuilder<RegisterProfileBloc, RegisterProfileState>(
            builder: (context, state) {
              return ListView(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                   Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 75,
                      foregroundImage: state.photo != null ? Image.file(state.photo!).image : AssetImage("assets/avatar_test.jpg"),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      IconText(onPressed:()=> () async {
                        final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

                        if(pickedFile != null) {
                          final filePath = File(pickedFile.path);
                          context.read<RegisterProfileBloc>().add(UploadPhotoEvent(filePath));
                        }
                      }),
                      Spacer(),
                    ],
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged: (data) {
                      context
                          .read<RegisterProfileBloc>()
                          .add(FirstNameEvent(data));
                    },
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSansBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    scrollPadding: EdgeInsets.only(bottom: 40),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your name here',
                      hintStyle: TextStyle(
                        color: hintTextColor,
                        fontFamily: 'OpenSansBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  CustomDatePicker(
                    text: state.birthDate.year != initTime.year
                        ? state.birthDate
                        : null,
                    hint: 'What is your date of birth? *',
                    onConfirm: (date) {
                      context
                          .read<RegisterProfileBloc>()
                          .add(DateBirthEvent(date));
                    },
                  ),
                  CustomDatePicker(
                    text: state.weddingDate.year != initTime.year
                        ? state.weddingDate
                        : null,
                    hint: 'When did you get married?',
                    onConfirm: (date) {
                      context
                          .read<RegisterProfileBloc>()
                          .add(MarriageDateEvent(date));
                    },
                  ),
                  CustomDatePicker(
                    text: state.firstMeetingDate.year != initTime.year
                        ? state.firstMeetingDate
                        : null,
                    hint: 'When did you and your partner met?',
                    onConfirm: (date) {
                      context
                          .read<RegisterProfileBloc>()
                          .add(FirstMeetingEvent(date));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Column(
                    children: [
                      ButtonWidget(
                        isEnable: state.enableButton,
                        text: 'GO TO YOUR NEW FAMILY',
                        onPressed: () {
                          context.read<FamilyBloc>().add(CreateFamilyEvent(
                                idParent:
                                    context.read<UserLogicBloc>().state.user.id,
                                familyName: context
                                    .read<UserLogicBloc>()
                                    .state
                                    .user
                                    .familyName,
                                weddingDate: state.weddingDate,
                                firstMeetingDate: state.firstMeetingDate,
                              ));
                          context.read<UserLogicBloc>().add(
                              UpdateOnFamilyCreatedEvent(
                                  state.firstName, state.birthDate, state.photo));
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      ButtonWidget(
                        color: secondaryColor,
                        text: 'GO BACK',
                        isSecondary: true,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
