import '../repository/models/model_barrel.dart';
import '../repository/service/program_service.dart';

class ProgramRepository {
  const ProgramRepository({
    required this.service,
  });
  final ProgramService service;

  Future<List<Program>> getPrograms() async => service.getPrograms();
}