import 'package:flutter/material.dart';
import 'package:layout/global-styles.dart';
import 'package:layout/login/login-page.dart';
import '../../../repository/models/model_barrel.dart';
import '../../../main.dart';


  class ProgramPageLayout extends StatelessWidget {
    const ProgramPageLayout({super.key, required this.program, required this.userEmail});
    final Program program;
    final String userEmail;

    @override
    Widget build(BuildContext context) {
      
      return ListView(
          children: [
            // Photo + Favorite Button
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                   image: NetworkImage(program.photo),
                   fit: BoxFit.cover
                 )
                  
              ),
            ),

            // Program Info
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Program date: ${program.date}', style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 224, 131, 0))),
                  const SizedBox(height: 20),
                  Text(program.details, style: const TextStyle(fontSize: 16),),
                ],
              ),
            ),

            // Buttons
            verticalButtonDivider,
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {
                      print('Going Back'),
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>  Tabs(email: loginEmail),
                          ),
                        )
                    }, 
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 224, 131, 0)), 
                    child: const Text('Back')
                  ),
                  const SizedBox(height: 100),
                ],
              )
          ],
      );
  }
}


         