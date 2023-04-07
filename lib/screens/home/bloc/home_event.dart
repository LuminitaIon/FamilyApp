part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetPartnerFromFirebase {
  String id;

  GetPartnerFromFirebase(this.id);
}