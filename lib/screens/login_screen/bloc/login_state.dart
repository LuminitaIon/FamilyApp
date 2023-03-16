part of 'login_bloc.dart';

class LoginState extends Equatable {
  String email;
  String password;
  LoginStates state;

  LoginState({
    this.email = '',
    this.password = '',
    this.state = LoginStates.init,
  });

  LoginState copyWith({String? email, String? password, LoginStates? state}) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        state: state ?? this.state,
      );

  @override
  List<Object> get props => [email, password, state];
}

enum LoginStates { init, success, error, loading }
