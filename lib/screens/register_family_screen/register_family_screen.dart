import 'package:familyapp/screens/register_family_screen/bloc/register_family_bloc.dart';
import 'package:familyapp/screens/register_family_screen/bloc/register_family_event.dart';
import 'package:familyapp/screens/register_family_screen/bloc/register_family_state.dart';
import 'package:familyapp/screens/register_profile_screen/bloc/register_profile_bloc.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../colors.dart';
import '../../route_name.dart';
import '../../user_bloc/user_logic_bloc.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/text_field.dart';

class RegisterFamilyScreen extends StatelessWidget {
  RegisterFamilyScreen({super.key});

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
                'Create your family group',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => RegisterFamilyBloc(),
        child: BlocListener<UserLogicBloc, UserLogicState>(
          listener: (context, state) {
            if (state.states == UserStates.logged) {
              Navigator.of(context).pushNamed(registerProfileScreen);
            }
          },
          child: BlocBuilder<RegisterFamilyBloc, RegisterFamilyState>(
            builder: (context, state) {
              if (state.states == RegisterStates.loading) {
                return const LoadingWidget();
              }
              return ListView(
                children: [
                  Image.asset("assets/register_family.jpg"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                      vertical: 8,
                    ),
                    child: TextFieldWidget(
                      onChange: (data) {
                        context
                            .read<RegisterFamilyBloc>()
                            .add(RegisterFamilyNameEvent(data));
                      },
                      hintText: 'Family Name',
                      error: state.errorFamilyName,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                      vertical: 8,
                    ),
                    child: TextFieldWidget(
                      onChange: (data) {
                        context
                            .read<RegisterFamilyBloc>()
                            .add(RegisterEmailEvent(data));
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
                      onChange: (data) {
                        context
                            .read<RegisterFamilyBloc>()
                            .add(RegisterPasswordEvent(data));
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
                      onChange: (data) {
                        context
                            .read<RegisterFamilyBloc>()
                            .add(RegisterConfirmPasswordEvent(data));
                      },
                      isPassword: true,
                      hintText: 'Confirm Password',
                      error: state.errorConfirmPassword,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Column(
                    children: [
                      ButtonWidget(
                        text: 'CREATE YOUR ACCOUNT',
                        onPressed: () {
                          context.read<UserLogicBloc>().add(CreateAccountEvent(
                              state.email, state.password, state.familyName));
                        },
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
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
