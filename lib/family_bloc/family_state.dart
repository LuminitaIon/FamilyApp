part of 'family_bloc.dart';

class FamilyState extends Equatable {
  FamilyStates states;
  FamilyModel family;

  FamilyState({this.states = FamilyStates.init, FamilyModel? family})
      : family = family ??
            FamilyModel(
              id: '',
              familyName: '',
              familyCode: '',
              idParent2: '',
              idParent1: ''
            );

  FamilyState copyWith({FamilyStates? states, FamilyModel? family}) =>
      FamilyState(
        states: states ?? this.states,
        family: family ?? this.family,
      );

  @override
  List<Object> get props => [states, family];
}

enum FamilyStates { init, loaded, loading, error }
