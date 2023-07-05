import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginAddEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<LoginAddPassword>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginToAccount>((event, emit) async {
      emit(state.copyWith(state: LoginStates.loading));
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: state.email, password: state.password);

        emit(state.copyWith(state: LoginStates.success));
      } catch ( e) {
        emit(state.copyWith(state: LoginStates.error));
      }
    });
    on<ForgotPassword>((event, emit) async{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: state.email);

    });
  }
}
