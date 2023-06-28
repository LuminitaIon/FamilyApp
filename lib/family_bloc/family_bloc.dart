import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/models/kids_model.dart';
import 'package:flutter/material.dart';
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
    on<AddChild>((event, emit) async{
      final newFamily = state.family.copyWith(children: [...state.family.children, event.kid]);
      await FirebaseFirestore.instance
          .collection('family')
          .doc(state.family.id).update(newFamily.toJson());
      emit(state.copyWith(family: newFamily));
    });
    on<UpdateFamilyEvent>((event, emit) async {
      await FirebaseFirestore.instance
          .collection('family')
          .doc(state.family.id)
          .update({"id_secondParent": event.id});
    });
    on<GetFamilyEvent>((event, emit) async {
      try {
        QuerySnapshot<Map<String, dynamic>> family = await FirebaseFirestore
            .instance
            .collection('family')
            .where("id_firstParent", isEqualTo: event.userId).limit(1)
            .get();
        if (family.size == 0) {
          family = await FirebaseFirestore.instance
              .collection('family')
              .where("id_secondParent", isEqualTo: event.userId).limit(1)
              .get();
        }
        if (family.size > 0) {
          emit(state.copyWith(
              states: FamilyStates.loaded,
              family: FamilyModel.fromJson(family.docs.first.data())));
        }
      }
      catch (e) {
        debugPrint(e.toString());
      }
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
