
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../models/family_model.dart';

part 'login_with_code_event.dart';

part 'login_with_code_state.dart';

class LoginWithCodeBloc extends Bloc<LoginWithCodeEvent, LoginWithCodeState> {
  LoginWithCodeBloc() : super(LoginWithCodeState()) {
    on<LoginCodeAddEvent>((event, emit) {
      emit(state.copyWith(code: event.code));
    });
    on<ButtonPressedEvent>((event, emit) async {
      emit(state.copyWith(state: LoginWithCodeStates.loading));
      try {
        String newCode =
            NumberFormat("000000000000", "en_US").format(int.parse(state.code));
        debugPrint(newCode);
        final fCode = await FirebaseFirestore.instance
            .collection('family')
            .where('family_code', isEqualTo: newCode)
            .get();
        if(fCode.docs.first.get('id_secondParent') != null) {
          emit(state.copyWith(state: LoginWithCodeStates.error));
          return;
        }
        if (fCode.size != 0) {
          emit(state.copyWith(
            family: FamilyModel.fromJson(fCode.docs.first.data()),
            state: LoginWithCodeStates.success,
          ));
        }
      } catch (e) {
        emit(state.copyWith(state: LoginWithCodeStates.error));
      }
    });
  }
}
