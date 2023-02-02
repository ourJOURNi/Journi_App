import 'package:flutter/material.dart';
import '../program-page/program-page-layout.dart';
import '../../../repository/models/model_barrel.dart';


class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key, required this.program, required this.userEmail});

  final Program program;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(program.title),
          bottomOpacity: 0.1,
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          backgroundColor: const Color.fromARGB(240, 19, 119, 200),
        ),
      body: ProgramPageLayout(program: program, userEmail: userEmail)
    );
  }
}