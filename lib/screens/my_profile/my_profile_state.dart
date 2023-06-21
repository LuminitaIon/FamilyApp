part of 'my_profile_cubit.dart';

enum MyProfileScreenState { loading, loaded, init }

class MyProfileState extends Equatable {
  final MyProfileScreenState state;
  final List<EventModel> result;

  const MyProfileState(
      {this.state = MyProfileScreenState.init, this.result = const []});

  MyProfileState copyWith({
    MyProfileScreenState? state,
    List<EventModel>? result,
  }) =>
      MyProfileState(
          state: state ?? this.state, result: result ?? this.result);

  @override
  List<Object> get props => [state, result];
}
