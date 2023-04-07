
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../models/family_model.dart';
import '../../../models/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) {

    });
  }

  getData(FamilyModel family, String userId) async {
    String? id = family.idParent1 == userId ? family.idParent2 : family
        .idParent1;
    if(id != null) {
      final user = await FirebaseFirestore.instance.collection('user')
          .doc(id)
          .get();

      UserModel userModel = UserModel.fromJson(user.data()!);
      emit(state.copyWith(HomePageStates.success, userModel));
    }
  }
}
