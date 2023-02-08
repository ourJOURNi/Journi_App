import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/model_barrel.dart';
import '../models/result_error.dart';
import '../../login/login-page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
String baseURL = dotenv.env['IP']!;

class ProfileService {
  ProfileService({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  // final String ip = dotenv.get('IP');
  final Client _httpClient;

  final Map<String, String> customHeaders = {"content-type": "application/json" };

  Future<Profile> getProfile(email) async {
    print('$email from getProfile() in Profile Service');

    final Uri url = Uri.http(baseURL, '/api/profile/get-user-profile');
    final response = await _httpClient.post(
      url,
      headers: customHeaders,
      body: jsonEncode({'email': email})
    );
    // final profile = Profile.fromJson(json.decode(response.body));
    // print(profile);
    final jsonResponse = response.body;
    final parsedJSON = jsonDecode(jsonResponse);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
          return Profile(
            email: parsedJSON['email'], 
            firstName: parsedJSON['firstName'], 
            lastName: parsedJSON['lastName'], 
            dateRegistered: parsedJSON['dateRegistered'],
            profilePicture: parsedJSON['profilePicture']
          );

      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingProfiles('Error getting profile info');
    }
  }
  Future<List<Program>> getFavoritePrograms(email) async {
    print('$loginEmail from getFavoritePrograms() in Profile Service');
    final Uri url = Uri.http(baseURL, '/api/profile/get-favorite-programs');
    final response = await _httpClient.post(
      url,
      headers: customHeaders,
      body: jsonEncode({'email': email})
    );
    // final profile = Profile.fromJson(json.decode(response.body));
    // print(profile);
    final jsonResponse = response.body;

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
          return List<Program>.from(
          json.decode(jsonResponse).map(
                (data) => {
                  Program.fromJson(data),
                }
              ),
          );

      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingProfiles('Error getting profile info');
    }
  }
  Future<List<Program>> favoriteProgram(email, id) async {
    print('$loginEmail from favoriteProgram() in Profile Service');
    final Uri url = Uri.http(baseURL, '/api/profile/favorite-program');
    final response = await _httpClient.post(
      url,
      headers: customHeaders,
      body: jsonEncode({'email': email, 'id': id})
    );
    // final profile = Profile.fromJson(json.decode(response.body));
    // print(profile);
    final jsonResponse = response.body;

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
          return List<Program>.from(
          json.decode(jsonResponse).map(
                (data) => {
                  Program.fromJson(data),
                }
              ),
          );

      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingProfiles('Error getting profile info');
    }
  }
  Future<List<Program>> unfavoriteProgram(email, id) async {
    print('$loginEmail from unfavoriteProgram() in Profile Service');
    final Uri url = Uri.http(baseURL, '/api/profile/unfavorite-program');
    final response = await _httpClient.post(
      url,
      headers: customHeaders,
      body: jsonEncode({'email': email, 'id': id})
    );
    final jsonResponse = response.body;

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
          return List<Program>.from(
          json.decode(jsonResponse).map(
                (data) => {
                  Program.fromJson(data),
                }
              ),
          );

      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingProfiles('Error getting profile info');
    }
  }

}