import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import '/utility/exception_handler.dart';
import '/utility/constants.dart';

class AppApi {
  Future<http.Response> getRawData() async {
    final http.Response response;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      response = await http.get(
        Uri.parse(baseURL),
        headers: headers,
      );
    } on TimeoutException {
      throw TimeoutException("Timed out");
    } on SocketException {
      throw NoInternetException('No Internet');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      throw UnknownException(e.toString());
    }
    return response;
  }
}
