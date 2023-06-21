import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/screens/add_child/add_child.dart';

part 'add_child_state.dart';

class AddChildCubit extends Cubit<AddChildState> {
  AddChildCubit() : super(AddChildState());

  changeDropDownValue(newValue) {
    emit(state.copyWith(dropDownValue: newValue));
  }

}