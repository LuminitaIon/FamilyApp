import 'package:familyapp/colors.dart';
import 'package:familyapp/widgets/button_widget.dart';
import 'package:familyapp/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../route_name.dart';
import '../../widgets/text_field.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
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
                  )),
            ),
            const SizedBox(width: 20),
            const Text('Welcome Back!'),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.state == LoginStates.success) {
              Navigator.of(context).pushNamed(dashboardScreen);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return ListView(
                children: [
                  Image.asset('assets/family_login.jpg'),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                      vertical: 8,
                    ),
                    child: TextFieldWidget(
                      onChange: (data) {
                        context.read<LoginBloc>().add(LoginAddEmailEvent(data));
                      },
                      hintText: 'Email',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                      vertical: 8,
                    ),
                    child: TextFieldWidget(
                      onChange: (data) {
                        context.read<LoginBloc>().add(LoginAddPassword(data));
                      },
                      hintText: 'Password',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.1,
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: ButtonWidget(
                      text: 'LOGIN',
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginToAccount());

                      },
                    ),
                  ),
                  Column(
                    children: [
                      ButtonText(
                        text: 'FORGOT PASSWORD',
                        onPressed: () {},
                      ),
                      const Center(
                        child: Text('OR'),
                      ),
                      ButtonText(
                        text: 'CREATE A NEW FAMILY GROUP',
                        onPressed: () {
                          Navigator.of(context).pushNamed(registerFamilyScreen);
                        },
                      ),
                      const SizedBox(
                        height: 16,
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
