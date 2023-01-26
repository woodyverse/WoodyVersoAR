import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:woodyversoar/app/api/global/baseurl_global.dart';

class API {
  //? Defines header
  Future<Map<String, String>?> _defaultHeader(
    bool withToken,
  ) async {
    if (withToken) {
      String? token = await _getToken();
      return {
        HttpHeaders.contentTypeHeader:
            "multipart/form-data; boundary=<calculated when request is sent>",
        HttpHeaders.contentLengthHeader: "<calculated when request is sent>",
        HttpHeaders.hostHeader: "<calculated when request is sent>",
        HttpHeaders.userAgentHeader: "PostmanRuntime/7.30.0",
        HttpHeaders.acceptHeader: "*/*",
        HttpHeaders.acceptEncodingHeader: "gzip, deflate, br",
        HttpHeaders.connectionHeader: "keep-alive",
        HttpHeaders.authorizationHeader: "Bearer ${token}"
      };
    } else {
      return {
        HttpHeaders.contentTypeHeader:
            "multipart/form-data; boundary=<calculated when request is sent>",
        HttpHeaders.contentLengthHeader: "<calculated when request is sent>",
        HttpHeaders.hostHeader: "<calculated when request is sent>",
        HttpHeaders.userAgentHeader: "PostmanRuntime/7.30.0",
        HttpHeaders.acceptHeader: "*/*",
        HttpHeaders.acceptEncodingHeader: "gzip, deflate, br",
        HttpHeaders.connectionHeader: "keep-alive",
      };
    }
  }

  //? Take token
  Future<String?> _getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString("API:token");
  }

  //? Get API
  Future<dynamic> get(String URL, bool withToken) async {
    try {
      Map<String, String>? headers;

      await _defaultHeader(withToken).then((value) => headers = value);

      return await http
          .get(
            Uri.parse("${BaseURLGlobal().URL}/$URL"),
            headers: headers,
          )
          .timeout(const Duration(minutes: 5));
    } catch (error) {
      print(error);
      return null;
    }
  }

  //? Post API
  Future<dynamic> post(String URL, bool withToken, Object? body) async {
    try {
      Map<String, String>? headers;

      await _defaultHeader(withToken).then((value) => headers = value);

      return await http
          .post(
            Uri.parse("${BaseURLGlobal().URL}/$URL"),
            headers: headers,
            body: json.encode(body),
          )
          .timeout(const Duration(minutes: 5));
    } catch (error) {
      print(error);
      return null;
    }
  }

  //? Put API
  Future<dynamic> put(String URL, bool withToken, Object? body) async {
    try {
      Map<String, String>? headers;

      await _defaultHeader(withToken).then((value) => headers = value);

      return await http
          .put(
            Uri.parse("${BaseURLGlobal().URL}/$URL"),
            headers: headers,
            body: json.encode(body),
          )
          .timeout(const Duration(minutes: 5));
    } catch (error) {
      print(error);
      return null;
    }
  }

  //? Delete API
  Future<dynamic> delete(String URL, bool withToken, Object? body) async {
    try {
      Map<String, String>? headers;

      await _defaultHeader(withToken).then((value) => headers = value);

      return await http
          .delete(
            Uri.parse("${BaseURLGlobal().URL}/$URL"),
            headers: headers,
            body: json.encode(body),
          )
          .timeout(const Duration(minutes: 5));
    } catch (error) {
      print(error);
      return null;
    }
  }
}
