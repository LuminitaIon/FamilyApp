import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:familyapp/screens/register_profile_screen/bloc/register_profile_event.dart';
import 'package:familyapp/screens/register_profile_screen/bloc/register_profile_state.dart';



class RegisterProfileBloc extends Bloc<RegisterProfileEvent, RegisterProfileState> {
  RegisterProfileBloc() : super(RegisterProfileState()) {
    on<DateBirthEvent>((event, emit) {
      emit(state.copyWith(birthDate: event.birthDate));
    });
    on<MarriageDateEvent>((event, emit) {
        emit(state.copyWith(weddingDate: event.marriageDate));
    });
    on<FirstMeetingEvent>((event, emit) {
      emit(state.copyWith(firstMeetingDate: event.firstMeetingDate));
    });
    on<FirstNameEvent>((event, emit) {
      emit(state.copyWith(firstName: event.data));
    });
    on<UploadPhotoEvent>((event, emit) {
      emit(state.copyWith(photo: event.photoUploaded));

    });
  }
}
