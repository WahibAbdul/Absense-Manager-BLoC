import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._baseUrl, {Dio? client}) : _client = client ?? Dio();

  final String _baseUrl;
  final Dio _client;

  Future<Map<String, dynamic>> get(
    path, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final response = await _client.get(
      '$_baseUrl$path',
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      return response.data;
    }
    return _throwException(response);
  }

  _throwException(Response response) {
    final message = '''
    ------------------------------------------------------------------------------------------------
    Failed to load data.
    Url: ${response.requestOptions.uri.toString()}
    Status code: ${response.statusCode}
    Body: ${response.data}
    Request: ${response.requestOptions.toString()}
    ------------------------------------------------------------------------------------------------
    ''';
    log(message);
    throw Exception(message);
  }
}
