import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/model_barrel.dart';
import '../models/result_error.dart';

String baseURL = dotenv.env['IP']!;

class ProgramService {
  ProgramService({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final Client _httpClient;

  final Uri url = Uri.http(baseURL, '/api/programs/get-all-programs');
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
  Future<List<Program>> getProgram(String id) async {
    print('$id from getProgram() in Program Service');
    final Uri url = Uri.http(baseURL, '/api/program/get-program-info');

    final response = await _httpClient.post(
      url,
      headers: customHeaders,
      body: jsonEncode({'id': id})
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
          return json.decode(response.body).map(
            (data) => Program.fromJson(data),
          );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingPrograms('Error getting games');
    }
  }

}