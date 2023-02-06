import 'dart:async';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/login/login-page.dart';
import '../login/register-page.dart';
import 'snackbars.dart';
import '../main.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

String baseURL = dotenv.env['IP']!;

void configLoginLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

Future<void> logout(context) async{
  EasyLoading.showSuccess('loading...', duration: const Duration(seconds: 1))
                .then((value) => {
                  Timer(const Duration(seconds: 1), () => {
                    warningSnackBar(context, "Logged out Successfully"),
                    EasyLoading.dismiss(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                  }
                  )
                }
              );
}

String userEmail = '';

Future<void> login(
  String loginEmail, 
  String password, 
  BuildContext context,
  TextEditingController emailCTRL,
  TextEditingController passwordCTRL,
  ) async {
    final Uri url = Uri.http(baseURL, '/api/profile/login-profile');
    final Map<String, String> customHeaders = {"content-type": "application/json" };

    print('Attempting to login');
    print(loginEmail);

    final response = await http.post(
        url, 
        headers: customHeaders,
        body: jsonEncode({"email": loginEmail, "password": password}));
      

    final jsonResponse = response.body;
    final parsedJSON = jsonDecode(jsonResponse);

    if(response.statusCode == 200) {
      print('Status 200! @ Login');
      print(parsedJSON['email']);
      print(parsedJSON['firstName']);
      print(parsedJSON['lastName']);
      print(parsedJSON['dateRegistered']);
      print(parsedJSON);
    }

    userEmail = email;

      EasyLoading.showSuccess('loading...', duration: const Duration(seconds: 1))
        .then((value) => {
          emailCTRL.clear(),
          passwordCTRL.clear(),
          
          Timer(const Duration(seconds: 1), () => {
            successSnackBar(context, "Logged in Successfully"),
            emailCTRL.clear(),
            passwordCTRL.clear(),
            EasyLoading.dismiss(),

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Tabs(email: loginEmail),
              ),
            ),
          })
        }
      );

      // return Profile(email: parsedJSON['email'], firstName: parsedJSON['firstName'], lastName: parsedJSON['lastName'], dateRegistered: parsedJSON['dateRegistered']);

    }



Future<void> register(
  String firstName, 
  String lastName, 
  String email, 
  String password, 
  String profilePicture,
  BuildContext context, 
  TextEditingController firstNameCTRL,
  TextEditingController lastNameCTRL,
  TextEditingController emailCTRL,
  TextEditingController passwordCTRL
  ) async {
    final Uri url = Uri.http(baseURL, '/api/profile/register-profile');
    final Map<String, String> customHeaders = {"content-type": "application/json" };

    await http.post(
          url, 
          headers: customHeaders,
          body: jsonEncode({"email": email, "password": password, "firstName": firstName, "lastName": lastName}))
            .then((value) => {
              print(value.request),
              print(value.statusCode),

              if(value.statusCode == 200) {
                EasyLoading.showSuccess('Registered!')
                  .then((value) => {
                    Timer(const Duration(seconds: 1), () => {
                    successSnackBar(context, "Hi ${firstName}! you can now log in."),
                    EasyLoading.dismiss(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                  }
                  )
                  }),
              },
              if(value.statusCode == 400) {
                failureSnackBar(context, "Please use another email.")
              }
              // TODO: Handle Network and Server Errors
            })
            .catchError((e) => { print(e.toString())});
}

Future<void> sendRegisterCode(String email, String code, BuildContext context) async {
  final Uri url = Uri.http(baseURL, '/api/profile/send-register-code');
  final Map<String, String> customHeaders = {"content-type": "application/json" };
  
  await http.post(
        url, 
        headers: customHeaders,
        body: jsonEncode({"email": email, "code": code}))
          .then((value) => {
            if(value.statusCode == 200) {
              infoSnackBar(context, 'Code sent to ${email}')
            }
          })
          .catchError((e) => { print(e.toString())});
 }

Future<void> changeEmail(String email, String newEmail, String password) async {
  final Uri url = Uri.http(baseURL, '/api/profile/update-email');
  final Map<String, String> customHeaders = {"content-type": "application/json" };

  
  await http.post(
        url, 
        headers: customHeaders,
        body: jsonEncode({"email": email, "newEmail": newEmail, "password": password}))
          .then((value) => {
            print(value.request),
            print(value.statusCode)
          })
          .catchError((e) => { print(e.toString())});
 }

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // register("Test", "Account", "eddie@journi.org", "12345");
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: const Color.fromARGB(255, 221, 125, 0),
        ),
        body: const RegisterForm()
    );
    
  }
}