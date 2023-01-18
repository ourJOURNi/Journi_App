part of 'profile-info.bloc.dart';

enum ProfileInfoStatus { 
  initial, 
  success, 
  error, 
  loading, 
  selected
}

extension ProfileInfoStatusX on ProfileInfoStatus {
  bool get isInitial => this == ProfileInfoStatus.initial;
  bool get isSuccess => this == ProfileInfoStatus.success;
  bool get isError => this == ProfileInfoStatus.error;
  bool get isLoading => this == ProfileInfoStatus.loading;
  bool get isSelected => this == ProfileInfoStatus.selected;

}

class ProfileInfoState { 
  ProfileInfoState({this.status = ProfileInfoStatus.initial});
  final ProfileInfoStatus status;

  setProfile(stateProfile) {
    print(stateProfile);
  }

  @override
  List<Object?> get props => [status];
  ProfileInfoState copyWith({
    profile,
    status
  }) {
    return ProfileInfoState(
      status: status);
  }
}
