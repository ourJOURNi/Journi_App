import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../repository/models/model_barrel.dart';
import '../../../../../repository/program_repository.dart';

part 'programs_event.dart';
part 'programs_state.dart';

class ProgramsBloc extends Bloc<AllProgramsEvent, ProgramsState> {
  ProgramsBloc({
    required this.programRepository,
  }) : super(const ProgramsState()) {
    on<GetPrograms>(_mapGetProgramsEventToState);
  }

  final ProgramRepository programRepository;

  void _mapGetProgramsEventToState(
      GetPrograms event, Emitter<ProgramsState> emit) async {
    try {
      emit(state.copyWith(status: ProgramsStatus.loading));
      final programs = await programRepository.getPrograms();
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: programs,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
}