import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/models/kids_model.dart';

part 'kids_state.dart';

class KidsCubit extends Cubit<KidsState> {
  KidsCubit() : super(const KidsState());

  Future<void> init() async {
    emit(state.copyWith(state: KidsScreenState.loading));
    final result = [
      KidsModel(name: "Vanila", age: 4),
      KidsModel(name: "George", age: 15, school: "Scoala generala")
    ];
    emit(state.copyWith(state: KidsScreenState.loaded, result: result));
  }
}
