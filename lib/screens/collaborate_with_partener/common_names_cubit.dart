import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'common_names_state.dart';

class CommonNamesCubit extends Cubit<CommonNamesState> {
  CommonNamesCubit() : super(const CommonNamesState());

  Future<void> init(List<String> list) async
  {
    emit(state.copyWith(state: CommonNamesScreenState.loading));
    emit(state.copyWith(state: CommonNamesScreenState.loaded, common: [...list.getRange(1, 3)]));

  }
}
