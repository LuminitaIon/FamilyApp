import 'package:familyapp/event_bloc/event_cubit.dart';
import 'package:familyapp/family_bloc/family_bloc.dart';
import 'package:familyapp/firebase_options.dart';
import 'package:familyapp/route_name.dart';
import 'package:familyapp/screens/add_child/add_child.dart';
import 'package:familyapp/screens/child_profile/child_profile_screen.dart';
import 'package:familyapp/screens/collaborate_with_partener/collaborate_with_partener_screen.dart';
import 'package:familyapp/screens/collaborate_with_partener/entering_name_screen.dart';
import 'package:familyapp/screens/dashboard/dashboard.dart';
import 'package:familyapp/screens/login_screen/login_screen.dart';
import 'package:familyapp/screens/login_with_code_screen/login_with_code_screen.dart';
import 'package:familyapp/screens/partener_profile/partener_profile_screen.dart';
import 'package:familyapp/screens/register_profile_screen/register_profile_screen.dart';
import 'package:familyapp/screens/splash_screen/splash_screen.dart';
import 'package:familyapp/screens/update_profile_screen/update_profile_screen.dart';
import 'package:familyapp/screens/welcome_screen/welcome_screen.dart';
import 'package:familyapp/user_bloc/user_logic_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/register_family_screen/register_family_screen.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserLogicBloc()),
        BlocProvider(create: (context) => FamilyBloc()),
        BlocProvider(

          create: (context) => EventCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          splashScreen: (context) => SplashScreen(),
          welcomeScreen: (context) => WelcomeScreen(),
          loginPageWithEmailScreen: (context) => LoginScreen(),
          loginWithCodeScreen: (context) => LoginWithCodeScreen(),
          registerFamilyScreen: (context) => RegisterFamilyScreen(),
          registerProfileScreen: (context) => const RegisterProfileScreen(),
          dashboardScreen: (context) =>
              BlocBuilder<EventCubit,EventState>(
                builder: (context, state) {
                  return Dashboard();
                },
              ),
          updateProfileScreen: (context) => const UpdateProfileScreen(),

        },
      ),
    );
  }
}
