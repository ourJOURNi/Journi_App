import '../repository/models/model_barrel.dart';
import '../repository/service/home_service.dart';

class HomeRepository {
  const HomeRepository({
    required this.homeService
  });
  final HomeService homeService;

  // Future<List<Program>> getPrograms() async => programService.getPrograms();
}