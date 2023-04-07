part of 'splash_bloc.dart';

@immutable
class SplashState extends Equatable {
  SplashScreenStates states;
  String? userId;

  SplashState (
    {this.states = SplashScreenStates.init, this.userId = ''});

  SplashState copyWith({
    SplashScreenStates? states,
    String? userId,
  }) => SplashState(states: states ?? this.states, userId: userId ?? this.userId);
  
  @override
  List<Object?> get props =>[states, userId];
}


enum SplashScreenStates {
  init,
  loading,
  userRedirect,
  loginRedirect,
}


