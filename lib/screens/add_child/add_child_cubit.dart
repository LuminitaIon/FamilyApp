import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/screens/add_child/add_child.dart';
import 'package:familyapp/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

part 'add_child_state.dart';

class AddChildCubit extends Cubit<AddChildState> {
  AddChildCubit() : super(AddChildState());

  changeDropDownValue(newValue) {
    emit(state.copyWith(dropDownValue: newValue));
  }

  changeName(String name) {
    emit(state.copyWith(name: name));
  }
  changeSchool(String name) {
    emit(state.copyWith(school: name));
  }
  selectDate(DateTime day) {
    emit(state.copyWith(birthDay: day));
  }

  putFile(File file) {
    emit(state.copyWith(photo: file));
  }

  uploadFile()async{
    String path ='';
    if(state.photo != null) {
      final fileName = basename(state.photo!.path);
      final destination = 'files/$fileName';
      final ref = await FirebaseStorage.instance
          .ref(destination)
          .child('file/')
          .putFile(state.photo!);
      path = await ref.ref.getDownloadURL();
    }
    emit(state.copyWith(path: path,state: AddChildStateScreen.loaded));
  }

}