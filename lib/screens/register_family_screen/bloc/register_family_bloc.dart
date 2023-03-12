import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/screens/register_family_screen/bloc/register_family_event.dart';
import 'package:familyapp/screens/register_family_screen/bloc/register_family_state.dart';
import 'package:meta/meta.dart';

import '../../../utils.dart';

class RegisterFamilyBloc
    extends Bloc<RegisterFamilyEvent, RegisterFamilyState> {
  RegisterFamilyBloc() : super(RegisterFamilyState()) {
    on<RegisterFamilyNameEvent>((event, emit) {
      final error = checkFamilyName(event.data);
      emit(state.copyWith(familyName: event.data, errorFamilyName: error));
    });

    on<RegisterEmailEvent>((event, emit) {
      final error = checkEmail(event.data);
      emit(state.copyWith(email: event.data, errorEmail: error));
    });

    on<RegisterPasswordEvent>((event, emit) {
      final error = checkPassword(event.data);
      final confirmError = state.confirmPassword.isNotEmpty
          ? checkPasswordMatch(event.data, state.confirmPassword)
          : null;
      emit(state.copyWith(password: event.data, errorPassword: error, errorConfirmPassword: confirmError));
    });

    on<RegisterConfirmPasswordEvent>((event, emit) {
      final error = checkPasswordMatch(state.password, event.data);
      emit(state.copyWith(
          confirmPassword: event.data, errorConfirmPassword: error));
    });
  }

  String checkPasswordMatch(String password, String confirmPassword) {
    if (confirmPassword == password) {
      return '';
    } else {
      return "Password does not match";
    }
  }

  checkFamilyName(String data) {
    if (letterRegex.hasMatch(data)) {
      return '';
    } else {
      return "The Family Name doesn't contain only letters";
    }
  }

  checkEmail(String data) {
    if (emailRegex.hasMatch(data)) {
      return '';
    } else {
      return "The entered email is invalid";
    }
  }

  checkPassword(String data) {
    if (data.length >= 8) {
      return '';
    } else {
      return "Your password must have at least 8 characters";
    }

  }
}
