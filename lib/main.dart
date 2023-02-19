import 'package:familyapp/route_name.dart';
import 'package:familyapp/screens/login_screen/login_screen.dart';
import 'package:familyapp/screens/login_with_code_screen/login_with_code_screen.dart';
import 'package:familyapp/screens/register_profile_screen/register_profile_screen.dart';
import 'package:familyapp/screens/splash_screen/splash_screen.dart';
import 'package:familyapp/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'screens/register_family_screen/register_family_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        splashScreen:(context) => SplashScreen(),
        welcomeScreen:(context) => WelcomeScreen(),
        loginPageWithEmailScreen: (context) => LoginScreen(),
        loginWithCodeScreen: (context) => LoginWithCodeScreen(),
        registerFamilyScreen : (context) =>  RegisterFamilyScreen(),
        registerProfileScreen : (context) => const RegisterProfileScreen(),
      },
    );
  }
}


