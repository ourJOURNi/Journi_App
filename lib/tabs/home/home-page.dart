import 'package:flutter/material.dart';

const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red);

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text('Home Page', style: optionStyle,
            ),
          )
        ],
      ),
    );
  }
}