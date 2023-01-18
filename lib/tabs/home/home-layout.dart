import 'package:flutter/material.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({super.key});

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