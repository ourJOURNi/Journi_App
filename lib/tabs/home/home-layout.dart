import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Column(
          children: [
            // Landing
            Row(),
            // Things to do
            Row(),
            // Photos
            Row(),
            // FAQs
            Row(),
          ],
        )
    );
  }
}