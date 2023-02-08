import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:layout/tabs/programs/bloc/programs_bloc.dart';
import '../../../custom-libs/snackbars.dart';
import '../program-page/program-page-layout.dart';
import '../../../repository/models/model_barrel.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key, required this.userEmail, required this.program});

  final String userEmail;
  final Program program;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              title: Text(program.title),
              bottomOpacity: 0.1,
              actions: [
                FavoriteWidget(id: program.id)
              ],
              backgroundColor: const Color.fromARGB(240, 19, 119, 200),
            ),
          body: ProgramPageLayout(program: program, userEmail: userEmail));
  }   
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key, required this.id});
  final String id;

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  late Program program;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getIsFavorited() {
    setState(() {
    });
  }
  favorite() {
    setState(() {
      print('Favoriting from Program Page');
      _isFavorited = true;
      favoriteSnackBar(context, "Added this program to Favorites");
      // context.read<ProgramsBloc>().add(FavoriteProgram(widget.id));
    });

  }
  unfavorite() {
    setState(() {
      _isFavorited = false;
      unfavoriteSnackBar(context, "Removed this program to Favorites");
    });
  }

  @override
  
  Widget build(BuildContext context) {
    return IconButton(
            icon: _isFavorited
            ? const Icon(
              Icons.favorite,
              color: Colors.red)
            : const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white),
            onPressed: () {
              if(_isFavorited) {
                unfavorite();
              } else {
                favorite();
              }
            },
          );
  }
}

