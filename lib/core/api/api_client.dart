// lib/core/api/api_client.dart

import 'package:http/http.dart' as http;

// Pass the token at build time:
//   flutter run --dart-define=API_TOKEN=<your_token>
const String token = String.fromEnvironment('API_TOKEN');

class ApiClient {
  final http.Client _client;
  final Uri baseUri;

  ApiClient({required http.Client client, required this.baseUri})
    : _client = client;

  Future<http.Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) => _client.get(
    baseUri.replace(path: baseUri.path + path, queryParameters: queryParameters),
    headers: {
      'Authorization': token,
      'Content-Type': 'application/json'},
  );
}
