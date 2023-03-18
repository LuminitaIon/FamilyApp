part of 'login_with_code_bloc.dart';

class LoginWithCodeState extends Equatable {
  String code;
  FamilyModel? family;
  LoginWithCodeStates state;

  LoginWithCodeState({
    this.code = '',
    this.family,
    this.state = LoginWithCodeStates.init,
  });

  LoginWithCodeState copyWith({String? code, LoginWithCodeStates? state, FamilyModel? family}) =>
      LoginWithCodeState(
        code: code ?? this.code,
        family: family ?? this.family,
        state: state ?? this.state,
      );

  @override
  List<Object?> get props => [code, state, family];
}

enum LoginWithCodeStates { init, success, error, loading }
