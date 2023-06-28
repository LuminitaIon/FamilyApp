import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/models/family_model.dart';
import 'package:familyapp/models/kids_model.dart';
import 'package:uuid/uuid.dart';

part 'kids_state.dart';

class KidsCubit extends Cubit<KidsState> {
  KidsCubit() : super(const KidsState());

  Future<void> init(FamilyModel family) async {
    emit(state.copyWith(state: KidsScreenState.loading));
    final result = family.children;
    emit(state.copyWith(state: KidsScreenState.loaded, result: result));
  }

  Future<void> addKid(KidsModel kid) async{
    List<KidsModel> list = state.result;
    list.add(kid);
    emit(state.copyWith(state: KidsScreenState.loaded, result: list.toList()));
  }
}
