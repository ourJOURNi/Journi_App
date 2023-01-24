import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../repository/models/model_barrel.dart';
import '../../../../../repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfilesBloc extends Bloc<AllProfilesEvent, ProfilesState> {
  ProfilesBloc({
    required this.profileRepository,
  }) : super(const ProfilesState()) {
    on<GetProfile>(_mapGetProfileEventToState);
  }

  final ProfileRepository profileRepository;

  void _mapGetProfileEventToState(
      GetProfile event, Emitter<ProfilesState> emit) async {
    try {
      emit(state.copyWith(status: ProfilesStatus.loading));
      final profile = await profileRepository.getProfile(state.profile.email);
      emit(
        state.copyWith(
          status: ProfilesStatus.success,
          profile: profile,
        ),
      );
    } catch (error) {
      print(error);
      emit(state.copyWith(status: ProfilesStatus.error));
    }
  }
}