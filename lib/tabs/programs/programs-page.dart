import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/tabs/programs/bloc/programs_bloc.dart';
import '../../../repository/program_repository.dart';
import '../../../repository/service/program_service.dart';
import '../programs/programs-layout.dart';


class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => ProgramRepository(service: ProgramService()),
        child: BlocProvider<ProgramsBloc>(
          create: (context) => ProgramsBloc(
            programRepository: context.read<ProgramRepository>())
            ..add(GetPrograms(),
          ),
          child: const ProgramsLayout(),
        ),
      )
    );
  }
}