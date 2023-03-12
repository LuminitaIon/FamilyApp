import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/utils.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

part 'user_logic_event.dart';
part 'user_logic_state.dart';

class UserLogicBloc extends Bloc<UserLogicEvent, UserLogicState> {
  UserLogicBloc() : super(UserLogicState()) {
    on<UserLogicEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
