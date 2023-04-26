import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ny_articles/app/services/app_exceptions.dart';

const Duration TIME_OUT_DURATION = Duration(minutes: 1);

class APIClient {
  final http.Client _client = http.Client();

  Future<dynamic> get(String url, {file = false, Map<String, String>? headers}) async {
    var uri = url;
    debugPrint('===GET request===, url: $uri');

    var responseJson = {};
    try {
      final response = await _client.get(Uri.parse(uri)).timeout(TIME_OUT_DURATION);
      responseJson = _returnResponse(response);
    } on TimeoutException {
      debugPrint('Request timed out');
      throw ApiNotRespondingException('API not responding in time', uri);
    } on SocketException {
      debugPrint('No net');
      throw FetchDataException('No Internet connection', uri);
    }

    debugPrint('---GET completed---, url: $url');
    return responseJson;
  }

  Future<dynamic> post(String baseUrl, String url, dynamic payloadObj) async {
    debugPrint('===POST request===, url: $url');
    var uri = baseUrl + url;
    var payload = json.encode(payloadObj);
    debugPrint(payload);
    dynamic responseJson;
    try {
      final response = await _client.post(Uri.parse(uri), body: payload).timeout(TIME_OUT_DURATION);
      responseJson = _returnResponse(response);
    } on TimeoutException {
      debugPrint('Request timed out');
      throw ApiNotRespondingException('API not responding in time', uri);
    } on SocketException {
      debugPrint('No net');
      throw FetchDataException('No Internet connection', uri);
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    debugPrint("Response: ${response.body}");
    switch (response.statusCode) {
      case 200:
        dynamic responseJson;
        if (response.body.isEmpty) {
          responseJson = {};
        } else {
          responseJson = json.decode(utf8.decode(response.bodyBytes));
        }
        return responseJson;
      case 204:
        return {};
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 401:
      case 403:
        throw UnauthorisedException(utf8.decode(response.bodyBytes), response.request?.url.toString());
      case 422:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        return responseJson;
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}',
            response.request?.url.toString());
    }
  }

  void close() => _client.close();
}
