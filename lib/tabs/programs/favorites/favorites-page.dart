import '../../../global-styles.dart';
import 'package:flutter/material.dart';

class ProgramFavoritesPage extends StatelessWidget {
  const ProgramFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body: const Center(child: Text('Favorites'))
    );
    
  }
}

