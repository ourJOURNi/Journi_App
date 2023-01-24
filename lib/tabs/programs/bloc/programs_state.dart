part of 'programs_bloc.dart';

enum ProgramsStatus { initial, success, error, loading }

extension ProgramsStatusX on ProgramsStatus {
  bool get isInitial => this == ProgramsStatus.initial;
  bool get isSuccess => this == ProgramsStatus.success;
  bool get isError => this == ProgramsStatus.error;
  bool get isLoading => this == ProgramsStatus.loading;
}

class ProgramsState extends Equatable {
  const ProgramsState({
    this.status = ProgramsStatus.initial,
    List<Program>? programs,
  }) : programs = programs ?? const [];

  final List<Program> programs;
  final ProgramsStatus status;

  @override
  List<Object?> get props => [status, programs];

  ProgramsState copyWith({
    List<Program>? programs,
    ProgramsStatus? status,
  }) {
    return ProgramsState(
      programs: programs ?? this.programs,
      status: status ?? this.status,
    );
  }
}