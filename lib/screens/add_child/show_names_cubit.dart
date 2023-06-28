import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_names_state.dart';

class ShowNamesCubit extends Cubit<ShowNamesState> {
  ShowNamesCubit() : super(ShowNamesState());

  changeIndex(int index){
    emit(state.copyWith(index: index));
  }

  searchName(String name) {
    emit(state.copyWith(searchedString: name));
  }
}
