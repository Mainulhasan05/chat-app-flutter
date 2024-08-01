import 'dart:convert';
import 'package:http/http.dart' as http;

import 'base/constant.dart';

class HttpRequestHelper {
  static final String baseUrl = Constant.domain;

  static String authToken = '';

  static Future<Map<String, dynamic>> get(String endpoint,
      {bool fullUrl = false}) async {
    if (fullUrl) {
      final response =
          await http.get(Uri.parse(endpoint), headers: _getHeaders());

      return _handleResponse(response);
    }
    final response =
        await http.get(Uri.parse('$baseUrl$endpoint'), headers: _getHeaders());

    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse('$baseUrl$endpoint'),
        headers: _getHeaders(), body: json.encode(data));
    print(Constant.domain);
    print('$baseUrl$endpoint');
    print(json.encode(data));

    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> postFormData(
      String endpoint, Map<String, dynamic> data) async {
    final encodedData = data.keys
        .map((key) =>
            '${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key].toString())}')
        .join('&');

    print(_getFormHeaders());

    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: _getFormHeaders(),
      body: encodedData,
    );

    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(Uri.parse('$baseUrl$endpoint'),
        headers: _getHeaders(), body: json.encode(data));
    return _handleResponse(response);
  }

  // delete method
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint'),
        headers: _getHeaders());
    return _handleResponse(response);
  }

  static Map<String, String> _getHeaders() {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      "Accept": "application/json",
    };

    if (authToken.isNotEmpty) {
      headers['Authorization'] = authToken;
    }

    return headers;
  }

  static Map<String, String> _getFormHeaders() {
    final headers = <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      "Accept": "application/json",
    };

    if (authToken.isNotEmpty) {
      headers['Authorization'] = authToken;
    }

    return headers;
  }

  // static String _encodeFormData(Map<String, dynamic> data) {
  //   return data.keys
  //       .map((key) =>
  //           "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}")
  //       .join("&");

  // }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      var error = json.decode(response.body);

      var data = {
        "status": false,
        "error": error['error'] ?? error['message'],
      };
      return data;
    }
  }

  static void setAuthToken(String token) {
    authToken = token;
  }
}
