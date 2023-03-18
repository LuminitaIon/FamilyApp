import 'package:familyapp/family_bloc/family_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_button.dart';
import '../../widgets/text_field.dart';
import '../../route_name.dart';
import 'bloc/login_with_code_bloc.dart';

class LoginWithCodeScreen extends StatelessWidget {
  final TextEditingController enterCodeController = TextEditingController();

  LoginWithCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSansBold',
          fontSize: 28,
        ),
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
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
            const Text(
              'Welcome Back!',
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginWithCodeBloc(),
        child: BlocConsumer<LoginWithCodeBloc, LoginWithCodeState>(
          listener: (context, state) {
            if(state.state == LoginWithCodeStates.success && state.family != null) {
              context.read<FamilyBloc>().add(GetFamilyFirebaseEvent(state.family!));
              Navigator.of(context).pushNamed(updateProfileScreen);
            }
            if(state.state == LoginWithCodeStates.error) {
              Fluttertoast.showToast(
                  msg: "This family doesn't exist. Please create your family",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.grey,
                  fontSize: 16
              );
            }
          },
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
                    hintText: 'ENTER CODE',
                    onChange: (data) {
                      context.read<LoginWithCodeBloc>().add(LoginCodeAddEvent(data));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.1,
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: ButtonWidget(
                    text: 'LOGIN',
                    onPressed: () {
                      context.read<LoginWithCodeBloc>().add(ButtonPressedEvent());
                    },
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    ButtonText(
                      text: 'CREATE A NEW FAMILY GROUP',
                      onPressed: () {
                        Navigator.of(context).pushNamed(registerProfileScreen);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
