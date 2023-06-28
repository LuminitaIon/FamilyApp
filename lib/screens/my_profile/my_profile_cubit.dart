import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/models/event_model.dart';

part 'my_profile_state.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(MyProfileState());

  Future<void> init() async {
    emit(state.copyWith(state: MyProfileScreenState.loading));
    final result =  [
        EventModel(
            title: "Gradinita Prezentare",
            place: "Gradinita numarul 5",
            time: DateTime(2023, 6, 1, 10),
            description: "",
           ),
         EventModel(
          title: "Scoala careu",
          place: "Scoala centrala",
          time: DateTime(2023, 6, 7, 10),
          description: "",
         ),
      ];

    emit(state.copyWith(state: MyProfileScreenState.loaded, result: result));
  }
}
