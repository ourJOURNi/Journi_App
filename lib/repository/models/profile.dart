import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Profile {
  const Profile({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateRegistered,
    required this.profilePicture
  });
  final String firstName;
  final String lastName;
  final String email;
  final String dateRegistered;
  final String profilePicture;

  static const empty = Profile(
    firstName: '',
    lastName: '',
    email: '',
    dateRegistered: '',
    profilePicture: ''
  );

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}