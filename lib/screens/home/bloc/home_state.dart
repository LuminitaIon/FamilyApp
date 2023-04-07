part of 'home_bloc.dart';

class HomeState extends Equatable {
  HomePageStates state;
  UserModel? user;

  HomeState({this.state = HomePageStates.init, this.user = null});

  HomeState copyWith(HomePageStates? state, UserModel? user) =>
      HomeState(state: state ?? this.state, user: user ?? this.user);

  @override
  List<Object?> get props => [state, user];
}

enum HomePageStates { init, loading, success, error }
