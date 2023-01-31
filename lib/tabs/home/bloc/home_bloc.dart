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
    on<HomeEvent>(_mapHomeEventEventToState);
  }

  final HomeRepository homeRepository;

  void _mapHomeEventEventToState(
      HomeEvent event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      // final home = await homeRepository.getHome(state.home.email);
      
      emit(
        state.copyWith(
          status: HomeStatus.success,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}