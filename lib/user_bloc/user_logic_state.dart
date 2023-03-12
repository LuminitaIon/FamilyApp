part of 'user_logic_bloc.dart';

class UserLogicState extends Equatable {
  UserStates states;
  UserModel user;

  UserLogicState({this.states = UserStates.nonLogged, UserModel? user})
      : user = user ??
            UserModel(
                familyName: '',
                firstName: '',
                id: '',
                birthDate: initTime,
                email: '');

  UserLogicState copyWith({UserStates? states, UserModel? user}) =>
      UserLogicState(states: this.states, user: this.user);

  @override
  List<Object> get props => [states];
}

enum UserStates { logged, nonLogged }
