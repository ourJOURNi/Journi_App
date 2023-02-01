part of 'home_bloc.dart';

enum HomeStatus { initial, success, error, loading }

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isSuccess => this == HomeStatus.success;
  bool get isError => this == HomeStatus.error;
  bool get isLoading => this == HomeStatus.loading;
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    List<Program>? programs,
  }) : programs = programs ?? const [];

  final HomeStatus status;
  final List<Program> programs;

  @override
  List<Object?> get props => [status, programs];

  HomeState copyWith({
    List<Program>? programs,
    HomeStatus? status,
  }) {
    return HomeState(
      programs: programs ?? this.programs,
      status: status ?? this.status,
    );
  }
}