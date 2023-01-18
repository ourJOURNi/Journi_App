import 'package:flutter/material.dart';
import '../programs/programs-toolbar/programs-toolbar.dart';
const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red);

class ProgramsPageLayout extends StatelessWidget {
  const ProgramsPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.asset('assets/det_skyline.jpeg'),
                  ),
                  const ListTile(
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Sign Up'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ), 
              Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.asset('assets/det_skyline.jpeg'),
                  ),
                  const ListTile(
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Sign Up'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ), 
              Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.asset('assets/det_skyline.jpeg'),
                  ),
                  const ListTile(
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Sign Up'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ), 
              Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.asset('assets/det_skyline.jpeg'),
                  ),
                  const ListTile(
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Sign Up'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ), 
              Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.asset('assets/det_skyline.jpeg'),
                  ),
                  const ListTile(
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Sign Up'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ), 
              Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Image.asset('assets/det_skyline.jpeg'),
                  ),
                  const ListTile(
                    title: Text('The Enchanted Nightingale'),
                    subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('Sign Up'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ), 
          ],
        ),
        const Positioned(
            top: 0,
            left: 0,
            child: ProgramsToolbarWidget()
            ),
      ],
      )
      
    );
  }
}