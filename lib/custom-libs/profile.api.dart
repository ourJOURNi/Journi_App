import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'snackbars.dart';
import '../main.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../tabs/profile/bloc/profile_bloc.dart';


void configLoading() {
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

Future<void> updateProfilePicture(
  String email, 
  String password, 
  BuildContext context,
  TextEditingController emailCTRL,
  TextEditingController passwordCTRL,
  ) async {
  final Uri url = Uri.http('192.168.0.169:8000', '/api/profile/update-profile-picture');
  final Map<String, String> customHeaders = {"content-type": "application/json" };

  await http.post(
        url, 
        headers: customHeaders,
        body: jsonEncode({"email": email, "password": password}))
          .then((value) => {
            if(value.statusCode == 200) {
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
                        builder: (context) => Tabs(email: email),
                      ),
                    ),
                  })
                }),
            },
            if(value.statusCode == 400) {
                failureSnackBar(context, "Bad email or password.")
            }
          })
          .catchError((e) => { print(e.toString())});
}

Future<void> updateName(
  BuildContext context,
  BuildContext blocContext,
  String email, 
  String firstName, 
  String lastName, 
  String password, 
  TextEditingController firstNameCTRL,
  TextEditingController lastNameCTRL,
  TextEditingController passwordCTRL
  ) async {
  final Uri url = Uri.http('192.168.0.169:8000', '/api/profile/update-name');
  final Map<String, String> customHeaders = {"content-type": "application/json" };

  await http.post(
        url, 
        headers: customHeaders,
        body: jsonEncode({"email": email, "firstName": firstName, "lastName": lastName, "password": password}))
          .then((value) => {
            if(value.statusCode == 200) {
              EasyLoading.showSuccess('loading...', duration: const Duration(seconds: 1))
                .then((value) => {
                  Timer(const Duration(seconds: 1), () => {
                    successSnackBar(context, "Updated Name Successfully!"),
                    firstNameCTRL.clear(),
                    lastNameCTRL.clear(),
                    passwordCTRL.clear(),
                    EasyLoading.dismiss(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Tabs(email: email),
                      ),
                    ),
                  })
                }),
            },
            if(value.statusCode == 400) {
                failureSnackBar(context, "Bad email or password.")
            }
          })
          .catchError((e) => { print(e.toString())});
}

Future<String> updateEmail(
  BuildContext context,
  BuildContext blocContext,
  String currentEmail, 
  String newEmail, 
  String password, 
  TextEditingController newEmailCTRL,
  TextEditingController passwordCTRL,
  ) async {
  final Uri url = Uri.http('192.168.0.169:8000', '/api/profile/update-email');
  final Map<String, String> customHeaders = {"content-type": "application/json" };

  await http.post(
        url, 
        headers: customHeaders,
        body: jsonEncode({"email": currentEmail, "newEmail": newEmail, "password": password}))
          .then((value) => {
            if(value.statusCode == 200) {
              EasyLoading.showSuccess('loading...', duration: const Duration(seconds: 1))
                .then((value) => {
                  Timer(const Duration(seconds: 1), () => {
                    successSnackBar(blocContext, "Updated Email Successfully!"),

                    print('blocContext in UpdateEmail()'),                                        
                    newEmailCTRL.clear(),
                    passwordCTRL.clear(),
                    EasyLoading.dismiss(),

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Tabs(email: newEmail),
                      ),
                    ),
                  }),
                  
                }),
                
            },
            
            if(value.statusCode == 400) {
                failureSnackBar(context, "Bad email or password."),
            }
          })
          .catchError((e) => { print(e.toString())});
          
          return newEmail;
}

Future<void> updatePassword(
  BuildContext context,
  BuildContext blocContext,
  String email, 
  String oldPassword, 
  String newPassword, 
  TextEditingController oldPasswordPasswordCTRL,
  TextEditingController newPasswordPasswordCTRL
  ) async {
  final Uri url = Uri.http('192.168.0.169:8000', '/api/profile/update-password');
  final Map<String, String> customHeaders = {"content-type": "application/json" };

  await http.post(
        url, 
        headers: customHeaders,
        body: jsonEncode({"email": email, "newPassword": newPassword}))
          .then((value) => {
            if(value.statusCode == 200) {
              EasyLoading.showSuccess('loading...', duration: const Duration(seconds: 1))
                .then((value) => {
                  Timer(const Duration(seconds: 1), () => {
                    successSnackBar(context, "Updated Password Successfully!"),
                    oldPasswordPasswordCTRL.clear(),
                    newPasswordPasswordCTRL.clear(),
                    EasyLoading.dismiss(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Tabs(email: email),
                      ),
                    ),
                  })
                }),
            },
            if(value.statusCode == 400) {
                failureSnackBar(context, "Bad email or password.")
            }
          })
          .catchError((e) => { print(e.toString())});
}

Future<Map <String, dynamic>> getProfileInfo() async {
    final Uri url = Uri.http('192.168.0.169:8000', '/api/profile/get-user-profile');
    final Map<String, String> customHeaders = {"content-type": "application/json" };       
    late Map <String, dynamic> profile;
    await http.post(
      url,
      headers: customHeaders,
      body: jsonEncode({"email": "eddielacrosse2@gmail.com"}))
        .then((value) => {
          profile = jsonDecode(value.body)
        });

      return profile;
    // print(profile);
}


