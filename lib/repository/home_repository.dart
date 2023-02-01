import '../repository/models/model_barrel.dart';
import '../repository/service/home_service.dart';
import '../repository/service/program_service.dart';

class HomeRepository {
  const HomeRepository({
    required this.homeService,
    required this.programService
  });

  final HomeService homeService;
  final ProgramService programService;

  Future<List<Program>> getPrograms() async => programService.getPrograms();
}