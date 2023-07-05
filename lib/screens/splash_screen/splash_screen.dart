import 'package:familyapp/family_bloc/family_bloc.dart';
import 'package:familyapp/route_name.dart';
import 'package:familyapp/screens/splash_screen/bloc/splash_bloc.dart';
import 'package:familyapp/user_bloc/user_logic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child:  MultiBlocListener(
  listeners: [
    BlocListener<UserLogicBloc, UserLogicState>(
        listener: (context, state) {
          if(state.states == UserStates.logged) {
            context.read<FamilyBloc>().add(GetFamilyEvent(state.user.id));
          }
        },
),
    BlocListener<FamilyBloc, FamilyState>(
      listener: (context, state) {
        if(state.states == FamilyStates.loaded) {
          Navigator.of(context).pushNamed(dashboardScreen);
        }
      },
    ),
  ],
  child: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state.states == SplashScreenStates.init) {
              context.read<SplashBloc>().add(SplashEvent());
            }
            if (state.states == SplashScreenStates.loginRedirect) {
              Navigator.of(context).pushNamed(welcomeScreen);

            }
            if (state.states == SplashScreenStates.userRedirect) {
              context.read<UserLogicBloc>().add(GetUserEvent(state.userId));

            }
          },
          builder: (context, state) {
            if (state.states == SplashScreenStates.init) {
              context.read<SplashBloc>().add(SplashEvent());
            }
              return Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.1,
                      left: 0,
                      right: MediaQuery.of(context).size.width * 0.02,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset('assets/family_splash.jpg'),
                    ),
                  ],
                ),
              );

          },
        ),
),
    );
  }
}
