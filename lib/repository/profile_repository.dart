import '../repository/models/model_barrel.dart';
import '../repository/service/profile_service.dart';

class ProfileRepository {
  const ProfileRepository({
    required this.service,
  });
  final ProfileService service;

  Future<Profile> getProfile(email) async => service.getProfile('eddie@journi.org');
}