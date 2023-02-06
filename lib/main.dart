// Flutter Splash Screen Docs @ https://docs.flutter.dev/development/ui/advanced/splash-screen
import 'package:flutter/material.dart';
import 'package:layout/tabs/programs/programs-page.dart';
import './tabs/home/home-page.dart';
import 'tabs/profile/profile-page.dart';
import 'login/login-page.dart';
import 'custom-libs/onboarding.api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

logout() {
  return const MaterialApp(
        home: Scaffold(
          body: LoginPage(),
        ),
      );
}

void main() async => {
  configLoginLoading(),
  await dotenv.load(fileName: ".env"),
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
        home: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: const Scaffold(
          body: LoginPage(),
        ),
        ),
      );
  }
}


class Tabs extends StatefulWidget {
  const Tabs({super.key, required String email});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // 0 = Home
  // 1 = Programs
  // 2 = Profile
  static int _selectedIndex = 0;
  
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    ProgramsPage(email: userEmail),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
