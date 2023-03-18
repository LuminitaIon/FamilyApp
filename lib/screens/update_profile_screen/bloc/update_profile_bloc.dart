import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:familyapp/utils.dart';

part 'update_profile_event.dart';

part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileBloc() : super(UpdateProfileState()) {
    on<PhotoUploadEvent>((event, emit) {
      emit(state.copyWith(photo: event.photoUploaded));
    });
    on<AddFirstNameEvent>((event, emit) {
      emit(state.copyWith(firstName: event.firstName));
    });
    on<AddEmailEvent>((event, emit) {
      final error = checkEmail(event.email);
      emit(state.copyWith(email: event.email, errorEmail: error));
    });
    on<AddPasswordEvent>((event, emit) {
      final error = checkPassword(event.password);
      final errorConfirm = state.confirmPassword.isNotEmpty
          ? checkPasswordMatch(event.password, state.confirmPassword)
          : null;
      emit(state.copyWith(
        password: event.password,
        errorPassword: error,
        errorConfirmPassword: errorConfirm,
      ));
    });
    on<AddConfirmPassword>((event, emit) {
      final errorConfirmed = checkPasswordMatch(state.password, event.confirmPassword);
      emit(state.copyWith(confirmPassword: event.confirmPassword, errorConfirmPassword: errorConfirmed));
    });
    on<AddBirthDateEvent>((event, emit) {
      emit(state.copyWith(birthDate: event.birthDate));
    });
    on<OnPressGoToFamily>((event, emit) {
      //TODO
    });
  }

  checkEmail(String email) {
    if (emailRegex.hasMatch(email)) {
      return '';
    } else {
      return "The entered email is invalid";
    }
  }

  checkPassword(String password) {
    if (password.length >= 8) {
      return '';
    } else {
      return "Your password must have at least 8 characters";
    }
  }

  checkPasswordMatch(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return '';
    } else {
      return "Password does not match";
    }
  }
}
