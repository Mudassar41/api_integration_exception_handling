import 'dart:convert';
import 'dart:io';

import '../utils/enums.dart';
import 'package:http/http.dart' as http;

import 'api_exceptions.dart';

class ApiBaseService {
  String baseUrl = 'https://jsonplaceholder.typicode.com';

  apiResponse(
      {required String url,
      required METHOD mathod,
      Map<String, String>? data}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      return _processResponse(response);
    } on SocketException {
      throw BadRequestException('Bad Request');
    } catch (e) {
      throw e.toString();
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;

      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException('Bad request');
      case 401:
      case 403:
        throw UnAuthorizedException('unauthorized');
      case 422:
        throw BadRequestException('Bad request');
      case 500:
      default:
        throw FetchDataException('...........Ooops...........');
    }
  }
}
