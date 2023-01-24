import 'dart:convert';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/model_barrel.dart';
import '../models/result_error.dart';

class ProfileService {
  ProfileService({
    http.Client? httpClient,
    this.baseUrl = 'http://192.168.0.169:8000/api',
  }) : _httpClient = httpClient ?? http.Client();

  final String baseUrl;
  // final String ip = dotenv.get('IP');
  final Client _httpClient;

  final Uri url = Uri.http('192.168.0.169:8000', '/api/profile/get-user-profile');
  final Map<String, String> customHeaders = {"content-type": "application/json" };

  Future<Profile> getProfile(String email) async {
    print('$email from LoginPage');
    final response = await _httpClient.post(
      url,
      headers: customHeaders,
      body: jsonEncode({'email': email})
    );
    // final profile = Profile.fromJson(json.decode(response.body));
    // print(profile);
    final jsonResponse = response.body;
    final parsedJSON = jsonDecode(jsonResponse);
    print(parsedJSON['email']);

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

}