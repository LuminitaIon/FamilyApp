import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/models/family_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

part 'entering_name_state.dart';

class EnteringNameCubit extends Cubit<EnteringNameState> {
  EnteringNameCubit() : super(const EnteringNameState());

  init(FamilyModel family, String currentId) async {
    emit(state.copyWith(state: EnteringNameScreenState.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(state: EnteringNameScreenState.loaded));
    // final databaseReference = FirebaseDatabase.instance.ref().child(family.id ?? '');
    // final rez =  await databaseReference.get();
    // if(rez.exists){
    //   debugPrint("${(rez.value as Map).keys.first}");
    //   if( [family.idParent2 ??"",family.idParent1 ??"" ].contains((rez.value as Map).keys.first)){
    //     await databaseReference.update({'${currentId}': true});
    //     emit(state.copyWith(state: EnteringNameScreenState.loaded));
    //   }
    // }else {
    //   await databaseReference.set({'$currentId': true});
    //   String otherPerent = family.idParent1 ?? '';
    //   if (otherPerent == currentId) {
    //     otherPerent = family.idParent2 ?? '';
    //   }
    //   databaseReference.onChildAdded.listen((event) async{
    //     if( otherPerent == event.snapshot.key && state.state != EnteringNameScreenState.loaded ){
    //       emit(state.copyWith(state: EnteringNameScreenState.loaded));
    //     }
    //   });
    // }
  }

  addName(String name) {
    List<String>
    list = []..addAll(state.names);
    list.add(name);
    emit(state.copyWith(names: list.toList()));
  }

  deleteName(int name) {
    List<String>
    list = []..addAll(state.names);
    list.removeAt(name);
    emit(state.copyWith(names: list.toList()));
  }
}
