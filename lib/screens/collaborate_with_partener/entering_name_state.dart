part of 'entering_name_cubit.dart';

enum EnteringNameScreenState { init, loading, loaded }

class EnteringNameState extends Equatable {
  final List<String> names;
  final EnteringNameScreenState state;

  const EnteringNameState(
      {this.names = const [], this.state = EnteringNameScreenState.init});

  EnteringNameState copyWith(
          {List<String>? names, EnteringNameScreenState? state}) =>
      EnteringNameState(
        names: names ?? this.names,
        state: state ?? this.state,
      );

  @override
  List<Object> get props => [names.length,state];
}
