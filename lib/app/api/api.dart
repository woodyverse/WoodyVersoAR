import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woodyversoar/app/api/global/baseurl_global.dart';
import 'package:woodyversoar/app/api/services/responseapi_sevice.dart';

class API {
  //? Defines header
  Future<Map<String, String>?> _defaultHeader(
    bool withToken,
  ) async {
    if (withToken) {
      String? token = await _getToken();
      return {
        HttpHeaders.contentTypeHeader: "multipart/form-data",
        HttpHeaders.acceptHeader: "*/*",
        HttpHeaders.acceptEncodingHeader: "gzip, deflate, br",
        HttpHeaders.connectionHeader: "keep-alive",
        HttpHeaders.authorizationHeader: "Bearer ${token}"
      };
    } else {
      return {
        HttpHeaders.contentTypeHeader: "multipart/form-data",
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

  // ? Process response
  ResponseAPIService _responseAPIService(dio.Response res) {
    final Map<String, dynamic> responseJSON = jsonDecode(res.data);
    return ResponseAPIService(response: responseJSON);
  }

  //? Get API
  Future<ResponseAPIService> get(String URL, bool withToken) async {
    try {
      Map<String, String>? headers;
      final dioRequest = dio.Dio();

      await _defaultHeader(withToken).then((value) => headers = value);

      dioRequest.options.baseUrl = BaseURLGlobal().URL;
      dioRequest.options.headers = headers;

      var res = await dioRequest.get(
        "/$URL",
      );

      return _responseAPIService(res);
    } catch (error) {
      print(error);
      return ResponseAPIService(response: null);
    }
  }

  //? Post API
  Future<ResponseAPIService> post(
      String URL, bool withToken, Map<String, dynamic>? body) async {
    try {
      Map<String, String>? headers;
      final dioRequest = dio.Dio();

      await _defaultHeader(withToken).then((value) => headers = value);

      dioRequest.options.baseUrl = BaseURLGlobal().URL;
      dioRequest.options.headers = headers;

      dio.FormData? formData;
      if (body != null) formData = dio.FormData.fromMap(body);

      var res = await dioRequest.post(
        "/$URL",
        data: formData,
      );

      return _responseAPIService(res);
    } catch (error) {
      print(error);
      return ResponseAPIService(response: null);
    }
  }

  //? Put API
  Future<ResponseAPIService> put(
      String URL, bool withToken, Map<String, dynamic>? body) async {
    try {
      Map<String, String>? headers;
      final dioRequest = dio.Dio();

      await _defaultHeader(withToken).then((value) => headers = value);

      dioRequest.options.baseUrl = BaseURLGlobal().URL;
      dioRequest.options.headers = headers;

      dio.FormData? formData;
      if (body != null) formData = dio.FormData.fromMap(body);

      var res = await dioRequest.put(
        "/$URL",
        data: formData,
      );

      return _responseAPIService(res);
    } catch (error) {
      print(error);
      return ResponseAPIService(response: null);
    }
  }

  //? Delete API
  Future<ResponseAPIService> delete(
      String URL, bool withToken, Map<String, dynamic>? body) async {
    try {
      Map<String, String>? headers;
      final dioRequest = dio.Dio();

      await _defaultHeader(withToken).then((value) => headers = value);

      dioRequest.options.baseUrl = BaseURLGlobal().URL;
      dioRequest.options.headers = headers;

      dio.FormData? formData;
      if (body != null) formData = dio.FormData.fromMap(body);

      var res = await dioRequest.delete(
        "/$URL",
        data: formData,
      );

      return _responseAPIService(res);
    } catch (error) {
      print(error);
      return ResponseAPIService(response: null);
    }
  }
}
