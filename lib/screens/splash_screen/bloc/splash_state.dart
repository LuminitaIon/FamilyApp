part of 'splash_bloc.dart';

@immutable
class SplashState extends Equatable {
  SplashScreenStates states;

  SplashState (
    {this.states = SplashScreenStates.init});

  SplashState copyWith({
    SplashScreenStates? states,
  }) => SplashState(states: states ?? this.states);
  
  @override
  List<Object?> get props =>[states];
}


enum SplashScreenStates {
  init,
  loading,
  userRedirect,
  loginRedirect,
}


