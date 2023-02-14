import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'snackbars.dart';
import '../main.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../tabs/profile/bloc/profile_bloc.dart';
import 'package:dio/dio.dart';

String baseURL = dotenv.env['IP']!;

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
  File updatedProfilePicture,
  BuildContext context,
  TextEditingController passwordCTRL,
  ) async {

  var updateProfilePictureFormData = FormData.fromMap({
      'password': password,
      'email': email,
      'profile-picture': await MultipartFile.fromFile(updatedProfilePicture.path, filename: basename(updatedProfilePicture.path))
    });

  final Uri url = Uri.http(dotenv.env['IP']!, '/api/profile/update-profile-picture');
  
  var dio = Dio();
  await dio.post(
        url.toString(), 
        data: updateProfilePictureFormData
        )
          .then((value) => {   
            if(value.statusCode == 200) {
              EasyLoading.showSuccess('loading...', duration: const Duration(seconds: 1))
                .then((value) => {
                  Timer(const Duration(seconds: 1), () => {
                    successSnackBar(context, "Updated Profile Picture"),
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
  final Uri url = Uri.http(baseURL, '/api/profile/update-name');
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
  final Uri url = Uri.http(baseURL, '/api/profile/update-email');
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
  final Uri url = Uri.http(baseURL, '/api/profile/update-password');
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
    final Uri url = Uri.http(baseURL, '/api/profile/get-user-profile');
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


