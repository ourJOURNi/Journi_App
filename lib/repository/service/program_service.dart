import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/model_barrel.dart';
import '../models/result_error.dart';

class ProgramService {
  ProgramService({
    http.Client? httpClient,
    this.baseUrl = 'http://192.168.0.169:8000/api',
  }) : _httpClient = httpClient ?? http.Client();

  final String baseUrl;
  // final String ip = dotenv.get('IP');
  final Client _httpClient;

  final Uri url = Uri.http('192.168.0.169:8000', '/api/programs/get-all-programs');
  final Map<String, String> customHeaders = {"content-type": "application/json" };

  Future<List<Program>> getPrograms() async {
    final response = await _httpClient.get(
      url,
      headers: customHeaders
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
          return List<Program>.from(
          json.decode(response.body).map(
                (data) => Program.fromJson(data),
              ),
          );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingPrograms('Error getting games');
    }
  }

}