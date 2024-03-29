
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
      update(event.firstName, event.birthDate, event.userPhoto, event.email);
    });

    on<CreateSecondParentEvent>((event, emit) {
      createSecondAcc(
        event.email,
        event.password,
        event.familyName,
        event.firstName,
        event.birthDate,
        event.userPhoto,
      );
    });

    on<GetUserEvent>((event, emit) async {
      final user = await FirebaseFirestore.instance.collection('user').doc(
          event.id).get();
      try {
        emit(state.copyWith(
            states: UserStates.logged, user: UserModel.fromJson(user.data()!)));
      } catch (e) {
        //
      }
    });

    on<LogoutEvent>((event, emit) async {
      await FirebaseAuth.instance.signOut();
      emit(UserLogicState());
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

  update(String firstName, DateTime birthDate, File? photo,
      String? email) async {
    if (photo != null) {
      final fileName = basename(photo!.path);
      final destination = 'files/$fileName';

      try {
        final ref = await firebase_storage.FirebaseStorage.instance
            .ref(destination)
            .child('file/')
            .putFile(photo);
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
      if (email != null) "email": email
    });

    final userUpdated = await FirebaseFirestore.instance
        .collection("user")
        .doc(state.user.id)
        .get();
    if (userUpdated.data() != null) {
      emit(state.copyWith(
          states: UserStates.logged,
          user: UserModel.fromJson(userUpdated.data()!)));
    }
  }

  createSecondAcc(String email, String password, String familyName,
      String firstName, DateTime birthDate, File? photo) async {
    final newUser = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    String imagePath = '';
    if (photo != null) {
      final fileName = basename(photo!.path);
      final destination = 'files/$fileName';
      try {
        final ref = await firebase_storage.FirebaseStorage.instance
            .ref(destination)
            .child('file/')
            .putFile(photo);
        imagePath = await ref.ref.getDownloadURL();
        debugPrint(state.user.imagePath);
      } catch (e) {
        print('error occured');
      }
    }
    final appUser = UserModel(
      familyName: familyName,
      id: newUser.user!.uid,
      email: email,
      firstName: firstName,
      birthDateTime: birthDate,
      imagePath: photo != null ? imagePath : '',
    );
    await FirebaseFirestore.instance.collection("user")
        .doc(newUser.user!.uid)
        .set(appUser.toJson());
    emit(state.copyWith(states: UserStates.logged, user: appUser));
  }
}
