// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/profile_repository.dart';
import '../../repository/service/profile_service.dart';
import '../../tabs/profile/bloc/profile_bloc.dart';
import '../profile/profile_layout.dart';
  
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => ProfileRepository(service: ProfileService()),
        child: BlocProvider<ProfilesBloc>(
          create: (context) => ProfilesBloc(
            profileRepository: context.read<ProfileRepository>())
            ..add(GetProfile(),
          ),
          child: const ProfilesLayout(),
        ),
      )
    );
  }
}