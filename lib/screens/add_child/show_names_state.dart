part of 'show_names_cubit.dart';

class ShowNamesState extends Equatable {
  final List<String> boyNames = ['Luca', 'Andrei', 'Cristi', 'Mihai'];
  final List<String> girlNames = [
    'Andreea',
    'Alina',
    'Clara',
    'Elena',
    'Cristina'
  ];
  final int index;
  final String searchedString;

  ShowNamesState({this.index = 0, this.searchedString = ''});

  List<String> get list => searchedString.isEmpty ? index == 0 ? boyNames : girlNames : index == 0 ? boyNames.where((element) => element.contains(searchedString)).toList() : girlNames.where((element) => element.contains(searchedString)).toList();

  ShowNamesState copyWith({int? index, String? searchedString}) =>
      ShowNamesState(
        index: index ?? this.index,
        searchedString: searchedString ?? this.searchedString,
      );

  @override
  List<Object> get props => [index,searchedString];
}
