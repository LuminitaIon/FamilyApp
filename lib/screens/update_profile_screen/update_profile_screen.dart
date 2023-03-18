import 'dart:io';

import 'package:familyapp/screens/update_profile_screen/bloc/update_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../colors.dart';
import '../../utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/custom_date_picker.dart';
import '../../widgets/icon_text_button.dart';
import '../../widgets/text_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileBloc(),
      child: BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
              title: Row(
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
                      "Let's update your new profile",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            body: ListView(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 75,
                    foregroundImage: state.photo != null
                        ? Image.file(state.photo!).image
                        : AssetImage("assets/avatar_test.jpg"),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    IconText(
                        onPressed: () => () async {
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);

                              if (pickedFile != null) {
                                final filePath = File(pickedFile.path);
                                context
                                    .read<UpdateProfileBloc>()
                                    .add(PhotoUploadEvent(filePath));
                              }
                            }),
                    Spacer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (data) {
                      context.read<UpdateProfileBloc>().add(AddFirstNameEvent(data));
                    },
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSansBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    scrollPadding: EdgeInsets.only(bottom: 40),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your name here',
                      hintStyle: TextStyle(
                        color: primaryColor.withOpacity(0.70),
                        fontFamily: 'OpenSansBold',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: 8,
                  ),
                  child: TextFieldWidget(
                    border: const BorderSide(color: primaryColor),
                    style: const TextStyle(
                      color: primaryColor,
                      fontFamily: 'OpenSansSemiBold',
                      fontSize: 20,
                    ),
                    onChange: (data) {
                     context.read<UpdateProfileBloc>().add(AddEmailEvent(data));
                    },
                    hintText: 'Email',
                    error: state.errorEmail,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: 8,
                  ),
                  child: TextFieldWidget(
                    border: const BorderSide(color: primaryColor),
                    style: const TextStyle(
                      color: primaryColor,
                      fontFamily: 'OpenSansSemiBold',
                      fontSize: 20,
                    ),
                    onChange: (data) {
                      context.read<UpdateProfileBloc>().add(AddPasswordEvent(data));
                    },
                    isPassword: true,
                    hintText: 'Password',
                    error: state.errorPassword,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15,
                    vertical: 8,
                  ),
                  child: TextFieldWidget(
                    border: const BorderSide(color: primaryColor),
                    style: const TextStyle(
                      color: primaryColor,
                      fontFamily: 'OpenSansSemiBold',
                      fontSize: 20,
                    ),
                    onChange: (data) {
                      context.read<UpdateProfileBloc>().add(AddConfirmPassword(data));
                    },
                    isPassword: true,
                    hintText: 'Confirm password',
                    error: state.errorConfirmPassword,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 32.0, left: 32.0, top: 16.0),
                  child: CustomDatePicker(
                    text: state.birthDate.year != initTime.year ? state.birthDate : null,
                    hint: 'What is your date of birth? *',
                    onConfirm: (data) {
                      context.read<UpdateProfileBloc>().add(AddBirthDateEvent(data));
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Column(
                  children: [
                    ButtonWidget(

                      text: 'GO TO YOUR FAMILY',
                      onPressed: () {},
                      isEnable: state.enableButton,
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
                        FocusScope.of(context)
                            .unfocus(); //TODO: add this every time you go on a previous page
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
