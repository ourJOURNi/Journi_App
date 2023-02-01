import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../repository/models/model_barrel.dart';
import '../../../repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.homeRepository,
  }) : super(const HomeState()) {
    on<GetPrograms>(_mapGetProgramsToState);
  }

  final HomeRepository homeRepository;

  void _mapGetProgramsToState(
      GetPrograms event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final programs = await homeRepository.getPrograms();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          programs: programs
        ),
      );
    } catch (error) {
      print(error);
      final programs = await homeRepository.getPrograms();
      emit(state.copyWith(
        status: HomeStatus.error,
        programs: programs
        ));
    }
  }
}