import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../custom-libs/profile.api.dart';
part 'profile-info.event.dart';
part 'profile-info.state.dart';

Map<String, dynamic> profile = {
  'id': '',
  'firstName': '',
  'lastName': '',
  'email': '',
  'profilePicture': '',
  'dateRegistered': '',
};

// Initialize Profile Page is user's information.
  final userProfile = getProfileInfo()
    .then((value) => {
    profile['id'] = value['_id'],
    profile['firstName'] = value['firstName'],
    profile['lastName'] = value['lastName'],
    profile['email'] = value['email'],
    profile['profilePicture'] = value['profilePicture'],
    profile['dateRegistered'] = value['dateRegistered'],
    print(value)
  });


class ProfileBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  ProfileBloc({ required profile}) : super(ProfileInfoState()) {
    on<ProfileInfoEvent>(_changeProfileInfoState);
  }

  _changeProfileInfoState(ProfileInfoEvent event, Emitter<ProfileInfoState> emit) async {
    
    await getProfileInfo()
        .then((value) => {
        profile['id'] = value['_id'],
        profile['firstName'] = value['firstName'],
        profile['lastName'] = value['lastName'],
        profile['email'] = value['email'],
        profile['profilePicture'] = value['profilePicture'],
        profile['dateRegistered'] = value['dateRegistered'],
        print(value)
    });

    emit(
      state.setProfile(profile)
    );
  }
}