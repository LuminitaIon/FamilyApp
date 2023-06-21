part of 'add_child_cubit.dart';

enum AddChildStateScreen {
  init,
  loading,
  loaded,
}

class AddChildState extends Equatable {
  final AddChildStateScreen state;
  final String dropDownValue;

  AddChildState({this.state = AddChildStateScreen.init, this.dropDownValue = 'boy'});

  AddChildState copyWith({
    AddChildStateScreen? state,
    String? dropDownValue,
  }) =>
      AddChildState(
          state: state ?? this.state,
          dropDownValue: dropDownValue ?? this.dropDownValue);

  @override
  List<Object> get props => [state, dropDownValue];
}
