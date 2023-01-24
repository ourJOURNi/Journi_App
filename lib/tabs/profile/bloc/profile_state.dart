part of 'profile_bloc.dart';

enum ProfilesStatus { initial, success, error, loading }

extension ProfilesStatusX on ProfilesStatus {
  bool get isInitial => this == ProfilesStatus.initial;
  bool get isSuccess => this == ProfilesStatus.success;
  bool get isError => this == ProfilesStatus.error;
  bool get isLoading => this == ProfilesStatus.loading;
}

class ProfilesState extends Equatable {
  const ProfilesState({
    this.status = ProfilesStatus.initial,
    Profile? profile,
  }) : profile = profile ?? Profile.empty;

  final Profile profile;
  final ProfilesStatus status;

  @override
  List<Object?> get props => [status, profile];

  ProfilesState copyWith({
    Profile? profile,
    ProfilesStatus? status,
  }) {
    return ProfilesState(
      profile: profile ?? this.profile,
      status: status ?? this.status,
    );
  }
}