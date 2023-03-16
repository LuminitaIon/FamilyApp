import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../models/user_model.dart';

part 'user_logic_event.dart';

part 'user_logic_state.dart';

class UserLogicBloc extends Bloc<UserLogicEvent, UserLogicState> {
  UserLogicBloc() : super(UserLogicState()) {
    on<CreateAccountEvent>((event, emit) {
      register(event.email, event.password, event.familyName);
    });

    on<UpdateOnFamilyCreatedEvent>((event, emit) {
      update(event.firstName, event.birthDate, event.userPhoto);
    });
  }

  register(String email, String password, String familyName) async {
    final newUser = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (newUser.user != null) {
      final appUser = UserModel(
          familyName: familyName, id: newUser.user!.uid, email: email);
      await FirebaseFirestore.instance
          .collection("user")
          .doc(newUser.user!.uid)
          .set(appUser.toJson());
      emit(state.copyWith(states: UserStates.logged, user: appUser));
    }
  }

  update(String firstName, DateTime birthDate, File? photo) async {
    if (photo != null) {
      final fileName = basename(photo!.path);
      final destination = 'files/$fileName';

      try {
        final ref = await firebase_storage.FirebaseStorage.instance
            .ref(destination)
            .child('file/').putFile(photo);
        state.user.imagePath = await ref.ref.getDownloadURL();
        debugPrint(state.user.imagePath);
      } catch (e) {
        print('error occured');
      }
    }

    await FirebaseFirestore.instance
        .collection("user")
        .doc(state.user.id)
        .update({
      "first_name": firstName,
      "birth_date": birthDate,
      "image_path": state.user.imagePath,
    });

    final userUpdated = await FirebaseFirestore.instance
        .collection("user")
        .doc(state.user.id)
        .get();
    if(userUpdated.data() != null) {
      emit(state.copyWith(states: UserStates.logged, user: UserModel.fromJson(userUpdated.data()!)));
    }

  }
}
