import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/tabs/home/bloc/home_bloc.dart';
import '../../repository/home_repository.dart';
import '../../../repository/service/home_service.dart';
import '../../../repository/service/program_service.dart';
import '../home/home-layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Journi 2023'),
          bottomOpacity: 0.1,
          backgroundColor: const Color.fromARGB(240, 19, 119, 200),
        ),
      body: RepositoryProvider(
        create: (context) => HomeRepository(homeService: HomeService(), programService: ProgramService()),
        child: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            homeRepository: context.read<HomeRepository>(),
            )
            ..add(GetPrograms(),
          ),
          child: const HomeLayout(),
        ),
      )
    );
  }
}