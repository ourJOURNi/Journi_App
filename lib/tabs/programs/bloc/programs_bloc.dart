import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/login/login-page.dart';
import '../../../../../repository/models/model_barrel.dart';
import '../../../../../repository/program_repository.dart';

part 'programs_event.dart';
part 'programs_state.dart';

class ProgramsBloc extends Bloc<AllProgramsEvent, ProgramsState> {
  ProgramsBloc({
    required this.programRepository,
  }) : super(const ProgramsState()) {
    on<GetPrograms>(_mapGetProgramsEventToState);
    on<GetProgram>(_mapGetProgramEventToState);
    on<SearchPrograms>(_mapSearchProgramsEventToState);

    on<SortProgramsBySoonest>(_mapSortProgramsBySoonestEventToState);
    on<SortProgramsByFurthest>(_mapSortProgramsByFurthestEventToState);

    on<FavoriteProgram>(_mapFavoriteProgramEventToState);
    on<UnfavoriteProgram>(_mapUnfavoriteProgramEventToState);

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
  void _mapGetProgramEventToState(
      GetProgram event, Emitter<ProgramsState> emit) async {
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
  void _mapSearchProgramsEventToState(
      SearchPrograms event, Emitter<ProgramsState> emit) async {
    try {
      print('SEARCHING PROGRAMS');

      emit(state.copyWith(status: ProgramsStatus.loading));

      bool searchTapped = event.searchTapped;
      String searchTerm = event.searchTerm;

      List<Program> filterPrograms = [];
      List<Program> initialPrograms = await programRepository.getPrograms();

      event.programs.forEach((program) {
        if(program.title.toLowerCase().contains(event.searchTerm.toLowerCase())) filterPrograms.add(program);
        if(event.searchTerm.isEmpty && searchTapped) filterPrograms = [];
        // if(event.searchTerm.isNotEmpty && searchTapped && filterPrograms.isEmpty) filterPrograms = initialPrograms;
      });

      if(filterPrograms.isEmpty) {
        print('No Results with that searchterm');
      }
      
      print('filterPrograms.length');
      print(filterPrograms.length);

      print('searchTapped:');
      print(searchTapped);

      print('searchTerm:');
      print(searchTerm);


      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          programs: searchTapped && filterPrograms.isEmpty && searchTerm.isEmpty ? initialPrograms : filterPrograms,
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
      final programs = await programRepository.getFavoritePrograms(loginEmail);
      print(programs);
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
  void _mapFavoriteProgramEventToState(
      FavoriteProgram event, Emitter<ProgramsState> emit) async {
    try {
      emit(state.copyWith(status: ProgramsStatus.loading));
      final programs = await programRepository.favoriteProgram(loginEmail, event.id);
      print(programs);
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          // programs: programs,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
  void _mapUnfavoriteProgramEventToState(
      UnfavoriteProgram event, Emitter<ProgramsState> emit) async {
    try {
      emit(state.copyWith(status: ProgramsStatus.loading));
      final programs = await programRepository.unfavoriteProgram(loginEmail, event.id);
      print(programs);
      emit(
        state.copyWith(
          status: ProgramsStatus.success,
          // programs: programs,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProgramsStatus.error));
    }
  }
 
  void _mapSortProgramsBySoonestEventToState(
      SortProgramsBySoonest event, Emitter<ProgramsState> emit) async {
    try {
      emit(state.copyWith(status: ProgramsStatus.loading));
      final programs = await programRepository.getPrograms();
      programs.sort((a, b) => a.date.compareTo(b.date));
      print(programs);
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
  void _mapSortProgramsByFurthestEventToState(
      SortProgramsByFurthest event, Emitter<ProgramsState> emit) async {
    try {
      emit(state.copyWith(status: ProgramsStatus.loading));
      final programs = await programRepository.getPrograms();
      programs.sort((a, b) => b.date.compareTo(a.date));
      print(programs);
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