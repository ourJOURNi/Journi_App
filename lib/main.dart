// Flutter Splash Screen Docs @ https://docs.flutter.dev/development/ui/advanced/splash-screen
import 'package:flutter/material.dart';
import 'package:layout/tabs/programs/programs-page.dart';
import 'tabs/home/home-layout.dart';
import 'tabs/profile/profile-page.dart';
import 'login/login-page.dart';
import 'custom-libs/onboarding.api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

logout() {
  return const MaterialApp(
        home: Scaffold(
          body: LoginPage(),
        ),
      );
}

void main() => {
  configLoginLoading(),
  runApp(const RootWidget())
};

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: EasyLoading.init(),
        home: const Scaffold(
          body: LoginPage(),
        ),
      );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({super.key, required String email}) : email = '';
  final String email;

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // 0 = Home
  // 1 = Programs
  // 2 = Profile
  int _selectedIndex = 2;
  var _pageName = "Home";
  
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePageLayout(),
    const ProgramsPage(),
    const ProfilePageWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0: {_pageName = "Home"; }
        break;
        case 1: {_pageName = "Programs"; }
        break;
        case 2: {_pageName = "Profile"; }
        break;

        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
  print('From Tabs');
  print(widget.email);
    
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(240, 19, 119, 200),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Programs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 255, 173, 58),
        onTap: _onItemTapped,
      ),
    );
  }
}
