import 'package:bloc/bloc.dart';
import 'package:familyapp/screens/splash_screen/splash_screen.dart';
import 'package:meta/meta.dart';
import "package:equatable/equatable.dart";
import 'package:firebase_auth/firebase_auth.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashEvent>((event, emit) async{
        emit(state.copyWith(states:SplashScreenStates.loading));
        await Future.delayed(Duration(seconds: 6));
        final auth = FirebaseAuth.instance.currentUser;
        if (auth != null) {
          emit(state.copyWith(states:SplashScreenStates.userRedirect, userId: auth.uid));
        }else {
          emit(state.copyWith(states: SplashScreenStates.loginRedirect));
        }
    });

  }
}
