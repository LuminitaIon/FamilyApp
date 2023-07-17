import 'package:familyapp/route_name.dart';
import 'package:familyapp/screens/splash_screen/splash_screen.dart';
import 'package:familyapp/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

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
      },
      
    );
  }
}


