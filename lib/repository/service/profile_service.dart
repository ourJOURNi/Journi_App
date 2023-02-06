import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/model_barrel.dart';
import '../models/result_error.dart';
import '../../login/login-page.dart';

class ProfileService {
  ProfileService({
    http.Client? httpClient,
    this.baseUrl = 'http://192.168.0.169:8000/api',
  }) : _httpClient = httpClient ?? http.Client();

  final String baseUrl;
  // final String ip = dotenv.get('IP');
  final Client _httpClient;

  final Map<String, String> customHeaders = {"content-type": "application/json" };

  Future<Profile> getProfile(email) async {
    print('$email from getProfile() in Profile Service');

    final Uri url = Uri.http('192.168.0.169:8000', '/api/profile/get-user-profile');
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
          return Profile(email: parsedJSON['email'], firstName: parsedJSON['firstName'], lastName: parsedJSON['lastName'], dateRegistered: parsedJSON['dateRegistered']);

      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingProfiles('Error getting profile info');
    }
  }
  Future<List<Program>> getFavoritePrograms(email) async {
    print('$loginEmail from getFavoritePrograms() in Profile Service');
    final Uri url = Uri.http('192.168.0.169:8000', '/api/profile/get-favorite-programs');
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

}