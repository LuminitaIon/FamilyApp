part of 'kids_cubit.dart';

enum KidsScreenState { loading, loaded, init }

class KidsState extends Equatable {
  final KidsScreenState state;
  final List<KidsModel> result;

  const KidsState({this.state = KidsScreenState.init, this.result = const []});

  KidsState copyWith({KidsScreenState? state, List<KidsModel>? result}) =>
      KidsState(
        state: state ?? this.state,
        result: result ?? this.result,
      );

  @override
  List<Object> get props => [state];
}
