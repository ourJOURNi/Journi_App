import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/login/login-page.dart';
import '../../../../../repository/models/model_barrel.dart';
import '../../../../../repository/program_repository.dart';
import '../../../../../repository/profile_repository.dart';

part 'programs_event.dart';
part 'programs_state.dart';

class ProgramsBloc extends Bloc<AllProgramsEvent, ProgramsState> {
  ProgramsBloc({
    required this.programRepository,
    // required this.profileRepository,
  }) : super(const ProgramsState()) {
    on<GetPrograms>(_mapGetProgramsEventToState);
    on<GetProgramsByFavorites>(_mapGetProgramsFavoritesEventToState);
    on<GetProgramsByCategoryOne>(_mapGetProgramsByCategoryOneEventToState);
    on<GetProgramsByCategoryTwo>(_mapGetProgramsByCategoryTwoEventToState);
    on<GetProgramsByCategoryThree>(_mapGetProgramsByCategoryThreeEventToState);
    on<GetProgramsByCategoryFour>(_mapGetProgramsByCategoryFourEventToState);
    on<GetProgramsByCategoryFive>(_mapGetProgramsByCategoryFiveEventToState);
    on<GetProgramsByCategorySix>(_mapGetProgramsByCategorySixEventToState);
    on<GetProgramsByCategorySeven>(_mapGetProgramsByCategorySevenEventToState);
    on<GetProgramsByCategoryEight>(_mapGetProgramsByCategoryEightEventToState);
  }

  final ProgramRepository programRepository;
  // final ProfileRepository profileRepository;

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
  void _mapGetProgramsFavoritesEventToState(
      GetProgramsByFavorites event, Emitter<ProgramsState> emit) async {
    try {
      emit(state.copyWith(status: ProgramsStatus.loading));
      final programs = await programRepository.getFavoritePrograms();
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
  void _mapGetProgramsByCategoryOneEventToState(
      GetProgramsByCategoryOne event, Emitter<ProgramsState> emit) async {
    try {
      // Change Status to Loading
      emit(state.copyWith(status: ProgramsStatus.loading));

      // Filter through programs vs Category
      final programs = await programRepository.getPrograms();
      final List<Program> filteredPrograms = [];
      const categoryID = "cat_1";

      programs.forEach((Program program) => {
        if(program.category == categoryID) {
          filteredPrograms.add(program)
        }
      });

      print('From GetProgramsByCategory EVENT: ---');
      print(programs);

      // CHange Status to Success with updated Programs
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: filteredPrograms,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
  void _mapGetProgramsByCategoryTwoEventToState(
      GetProgramsByCategoryTwo event, Emitter<ProgramsState> emit) async {
    try {
      // Change Status to Loading
      emit(state.copyWith(status: ProgramsStatus.loading));

      // Filter through programs vs Category
      final programs = await programRepository.getPrograms();
      final List<Program> filteredPrograms = [];
      const categoryID = "cat_2";

      programs.forEach((Program program) => {
        if(program.category == categoryID) {
          filteredPrograms.add(program)
        }
      });

      print('From GetProgramsByCategory EVENT: ---');
      print(filteredPrograms);

      // CHange Status to Success with updated Programs
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: filteredPrograms,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
  void _mapGetProgramsByCategoryThreeEventToState(
      GetProgramsByCategoryThree event, Emitter<ProgramsState> emit) async {
    try {
      // Change Status to Loading
      emit(state.copyWith(status: ProgramsStatus.loading));

      // Filter through programs vs Category
      final programs = await programRepository.getPrograms();
      final List<Program> filteredPrograms = [];
      const categoryID = "cat_3";

      programs.forEach((Program program) => {
        if(program.category == categoryID) {
          filteredPrograms.add(program)
        }
      });
      print('From GetProgramsByCategory EVENT: ---');
      print(filteredPrograms);

      // CHange Status to Success with updated Programs
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: filteredPrograms,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
  void _mapGetProgramsByCategoryFourEventToState(
      GetProgramsByCategoryFour event, Emitter<ProgramsState> emit) async {
    try {
      // Change Status to Loading
      emit(state.copyWith(status: ProgramsStatus.loading));

      // Filter through programs vs Category
      final programs = await programRepository.getPrograms();
      final List<Program> filteredPrograms = [];
      const categoryID = "cat_4";

      programs.forEach((Program program) => {
        if(program.category == categoryID) {
          filteredPrograms.add(program)
        }
      });
      print('From GetProgramsByCategory EVENT: ---');
      print(filteredPrograms);

      // CHange Status to Success with updated Programs
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: filteredPrograms,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
  void _mapGetProgramsByCategoryFiveEventToState(
      GetProgramsByCategoryFive event, Emitter<ProgramsState> emit) async {
    try {
      // Change Status to Loading
      emit(state.copyWith(status: ProgramsStatus.loading));

      // Filter through programs vs Category
      final programs = await programRepository.getPrograms();
      final List<Program> filteredPrograms = [];
      const categoryID = "cat_5";

      programs.forEach((Program program) => {
        if(program.category == categoryID) {
          filteredPrograms.add(program)
        }
      });

      print('From GetProgramsByCategory EVENT: ---');
      print(filteredPrograms);

      // CHange Status to Success with updated Programs
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: filteredPrograms,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
  void _mapGetProgramsByCategorySixEventToState(
      GetProgramsByCategorySix event, Emitter<ProgramsState> emit) async {
    try {
      // Change Status to Loading
      emit(state.copyWith(status: ProgramsStatus.loading));

      // Filter through programs vs Category
      final programs = await programRepository.getPrograms();
      final List<Program> filteredPrograms = [];
      const categoryID = "cat_6";

      programs.forEach((Program program) => {
        if(program.category == categoryID) {
          filteredPrograms.add(program)
        }
      });

      print('From GetProgramsByCategory EVENT: ---');
      print(filteredPrograms);

      // CHange Status to Success with updated Programs
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: filteredPrograms,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
  void _mapGetProgramsByCategorySevenEventToState(
      GetProgramsByCategorySeven event, Emitter<ProgramsState> emit) async {
    try {
      // Change Status to Loading
      emit(state.copyWith(status: ProgramsStatus.loading));

      // Filter through programs vs Category
      final programs = await programRepository.getPrograms();
      final List<Program> filteredPrograms = [];
      const categoryID = "cat_7";

      programs.forEach((Program program) => {
        if(program.category == categoryID) {
          filteredPrograms.add(program)
        }
      });

      print('From GetProgramsByCategory EVENT: ---');
      print(filteredPrograms);

      // CHange Status to Success with updated Programs
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: filteredPrograms,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
  void _mapGetProgramsByCategoryEightEventToState(
      GetProgramsByCategoryEight event, Emitter<ProgramsState> emit) async {
    try {
      // Change Status to Loading
      emit(state.copyWith(status: ProgramsStatus.loading));

      // Filter through programs vs Category
      final programs = await programRepository.getPrograms();
      final List<Program> filteredPrograms = [];
      const categoryID = "cat_8";

      programs.forEach((Program program) => {
        if(program.category == categoryID) {
          filteredPrograms.add(program)
        }
      });

      print('From GetProgramsByCategory EVENT: ---');
      print(filteredPrograms);

      // CHange Status to Success with updated Programs
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: filteredPrograms,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
}