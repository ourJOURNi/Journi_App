import 'package:layout/login/login-page.dart';

import '../repository/models/model_barrel.dart';
import '../repository/service/program_service.dart';
import '../repository/service/profile_service.dart';

class ProgramRepository {
  const ProgramRepository({
    required this.programService,
    required this.profileService,
  });
  final ProgramService programService;
  final ProfileService profileService;

  Future<List<Program>> getPrograms() async => programService.getPrograms();
  Future<List<Program>> getProgram(id) async => programService.getProgram(id);
  Future<List<Program>> getFavoritePrograms(email) async => profileService.getFavoritePrograms(loginEmail);
  Future<List<Program>> favoriteProgram(email, id) async => profileService.favoriteProgram(loginEmail, id);
  Future<List<Program>> unfavoriteProgram(email, id) async => profileService.unfavoriteProgram(loginEmail, id);
}