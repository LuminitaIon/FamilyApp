part of 'add_child_cubit.dart';

enum AddChildStateScreen {
  init,
  loading,
  loaded,
}

class AddChildState extends Equatable {
  final AddChildStateScreen state;
  final String dropDownValue;
  final String name;
  final String school;
  late final DateTime day;
  final File? photo;
  final String path;

  AddChildState({
    this.state = AddChildStateScreen.init,
    this.dropDownValue = 'boy',
    this.name = "",
    this.school = "",
    DateTime? birthDay,
    this.photo,
    this.path ='',

  }) : this.day = birthDay ?? initTime;

  AddChildState copyWith({
    AddChildStateScreen? state,
    String? dropDownValue,
    String? name,
    String? school,
    String? path,
    DateTime? birthDay,
    File? photo,
  }) =>
      AddChildState(
          state: state ?? this.state,
          name: name ?? this.name,
          photo: photo ?? this.photo,
          school: school ?? this.school,
          path: path ?? this.path,
          birthDay: birthDay ?? this.day,
          dropDownValue: dropDownValue ?? this.dropDownValue);

  @override
  List<Object?> get props => [state, dropDownValue, name,day,path,school,photo];
}
