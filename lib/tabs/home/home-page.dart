import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout/tabs/home/bloc/home_bloc.dart';
import '../home/home-layout.dart';
import '../../repository/home_repository.dart';
import '../../../repository/service/home_service.dart';


const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red);

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => HomeRepository(homeService: HomeService()),
        child: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            homeRepository: context.read<HomeRepository>()),
          child: const HomeLayout(),
        ),
      )
    );
  }
}