import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartpay/network/custom_exception.dart';

class ApiProvider {
  final http.Client _client = http.Client();
  ApiProvider();
  final String _baseUrl = "http://146.190.74.11/api/v1";


  void cancelRequest() {
    _client.close();
  }

  Future<dynamic> get(String url, String authToken) async {
    dynamic responseJson;
    try {
      final response = await _client.get(
        Uri.parse(_baseUrl + url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json; charset=UTF-8; multipart/form-data',
        },
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  Future<dynamic> patch(String url, String authToken) async {
    dynamic responseJson;
    try {
      final response = await _client.patch(
        Uri.parse(_baseUrl + url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  Future<dynamic> post(String url, Map<String, dynamic> data, String authToken) async {
    dynamic responseJson;
    try {
      final response = await _client.post(
          Uri.parse(_baseUrl + url),
          headers: <String, String>{
            'Accept': 'application/json',
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data)
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  dynamic _response(http.Response response) {
    try {
      dynamic responseJson = json.decode(response.body.toString());
      return responseJson;
    } catch(e) {
      debugPrint('ApiProvider');
      return e.toString();
    }

    // switch (response.statusCode) {
    //   case 200:
    //     dynamic responseJson = json.decode(response.body.toString());
    //     return responseJson;
    //   case 400:
    //     throw BadRequestException(response.body.toString());
    //   case 202:
    //     dynamic responseJson = json.decode(response.body.toString());
    //     return responseJson;
    //   case 401:
    //   case 403:
    //     throw UnauthorisedException(response.body.toString());
    //   case 500:
    //   default:
    //     throw FetchDataException(
    //         'Error occurred while Communication with Server with StatusCode : ${response.statusCode}'
    //     );
    // }
  }

}
