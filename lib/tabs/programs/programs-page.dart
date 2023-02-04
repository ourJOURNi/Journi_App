import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/repository/service/profile_service.dart';
import 'package:layout/tabs/programs/bloc/programs_bloc.dart';
import '../../../repository/program_repository.dart';
import '../../../repository/service/program_service.dart';
import '../programs/programs-layout.dart';


class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => ProgramRepository(programService: ProgramService(), profileService: ProfileService()),
        child: BlocProvider<ProgramsBloc>(
          create: (context) => ProgramsBloc(
            programRepository: context.read<ProgramRepository>(),
            // profileRepository: context.read<ProfileRepository>()
            )
            ..add(GetPrograms(),
          ),
          child: const ProgramsLayout(),
        ),
      )
    );
  }
}