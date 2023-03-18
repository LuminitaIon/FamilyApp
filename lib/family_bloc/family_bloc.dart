
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../models/family_model.dart';

part 'family_event.dart';

part 'family_state.dart';

class FamilyBloc extends Bloc<FamilyEvent, FamilyState> {
  FamilyBloc() : super(FamilyState()) {
    on<CreateFamilyEvent>((event, emit) {
      register(event);
    });
    on<GetFamilyFirebaseEvent>((event, emit) {
      emit(state.copyWith(family: event.family));
    });
  }

  register(CreateFamilyEvent event) async {
    int lastCodeUsed = 0;
    try {
      final docs = await FirebaseFirestore.instance
          .collection("family")
          .orderBy("family_code", descending: true)
          .limit(1)
          .get();
      lastCodeUsed = int.parse(docs.docs.first.data()["family_code"] as String);
    } catch (e) {}
    final newFamily = FamilyModel(
      id: const Uuid().v4(),
      familyName: event.familyName,
      familyCode:
          NumberFormat("000000000000", "en_US").format(lastCodeUsed + 1),
      idParent1: event.idParent,
    );
    await FirebaseFirestore.instance
        .collection("family")
        .doc(newFamily.id)
        .set(newFamily.toJson());
    emit(state.copyWith(family: newFamily, states: FamilyStates.loaded));
  }
}
