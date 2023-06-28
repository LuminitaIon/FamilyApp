part of 'common_names_cubit.dart';

enum CommonNamesScreenState {
  init,
  loading,
  loaded,
}

class CommonNamesState extends Equatable {
  final CommonNamesScreenState state;
  final List<String> common;

  const CommonNamesState(
      {this.common = const [], this.state = CommonNamesScreenState.init});

  CommonNamesState copyWith({
    List<String>? common,
    CommonNamesScreenState? state,
  }) =>
      CommonNamesState(
        common: common ?? this.common,
        state: state ?? this.state,
      );

  @override
  List<Object> get props => [common];
}
