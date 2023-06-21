import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/utils.dart';

part 'add_event_state.dart';

class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit() : super(AddEventState());

  changeTitle(String title){
    emit(state.copyWith(title: title));
  }

  changeDescription(String title){
    emit(state.copyWith(description: title));
  }

  changeDate(DateTime title){
    emit(state.copyWith(time: title));
  }
  changePlace(String title){
    emit(state.copyWith(palce: title));
  }
}
