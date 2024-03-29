part of 'programs_bloc.dart';

class AllProgramsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class GetPrograms extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class GetProgram extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class SearchPrograms extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
  List<Program>  programs = [];
  String searchTerm = '';
  bool searchTapped = false;
  bool searchEmpty = false;
  SearchPrograms(this.programs, this.searchTapped, this.searchTerm, this.searchEmpty);

}
class SortProgramsBySoonest extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class SortProgramsByFurthest extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class GetProgramsByFavorites extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class FavoriteProgram extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
  String id = '';
  FavoriteProgram(this.id);
}
class UnfavoriteProgram extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
  String id = '';
  UnfavoriteProgram(this.id);
}
class GetProgramsByCategoryOne extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class GetProgramsByCategoryTwo extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class GetProgramsByCategoryThree extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class GetProgramsByCategoryFour extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class GetProgramsByCategoryFive extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class GetProgramsByCategorySix extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class GetProgramsByCategorySeven extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}
class GetProgramsByCategoryEight extends AllProgramsEvent {
  @override
  List<Object?> get props => [];
}