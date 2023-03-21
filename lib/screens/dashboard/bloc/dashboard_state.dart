part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final int index;

  DashboardState({this.index = 0});

  DashboardState copyWith({int? index}) =>
      DashboardState(index: index ?? this.index);

  @override
  List<Object> get props => [index];
}
