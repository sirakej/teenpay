import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'error_handler.dart';

/// A network helper class to do all the back end request
class NetworkUtil{

  var errorHandler = ErrorHandler();

  /// next three lines makes this class a Singleton
  static final NetworkUtil _instance = NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  /// An object for decoding json values
  final JsonDecoder _decoder = const JsonDecoder();

  /// A function to do any get request with the [url], [body] and [headers]
  /// then sends back a json decoded result
  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    if(kDebugMode){
      log(url); log(json.encode(headers));
    }
    try {
      headers!['Content-Type'] = 'application/json';
      return
        http
            .get(Uri.parse(url), headers: headers)
            .then((http.Response response) {
          final String res = response.body;
          if(kDebugMode) log(res.toString());
          final int statusCode = response.statusCode;
          var result = _decoder.convert(res);
          if (statusCode < 200 || statusCode > 200 || statusCode >= 400) {
            throw result['msg'] ?? 'Error occurred, please try again';
          }
          return result;
        });
    } catch (e) {
      rethrow;
    }
  }

  /// A function to do any post request with the [url], [headers], [body] and
  /// [encoding] then sends back a json decoded result
  Future<dynamic> post(String url, {Map<String, String>? headers, body}) {
    if(kDebugMode){
      log(url); log(json.encode(headers)); log(json.encode(body));
    }
    try {
      headers!['Content-Type'] = 'application/json';

      return http
          .post(Uri.parse(url), body: json.encode(body), headers: headers)
          .then((http.Response response) {
        final String res = response.body;
       if(kDebugMode) log(res.toString());
        final int statusCode = response.statusCode;
        log(response.statusCode.toString());
        var result = _decoder.convert(json.encoder.convert(res));
        if (statusCode == 400) throw ('Unauthorized');
        if (statusCode < 200 || statusCode > 200 || statusCode >= 400) {
          throw result;
        }
          return result;
      });
    }catch(e) {
      rethrow;
    }
  }

  /// A function to do any post request of form data with the [url], [files],
  /// [header], [body] and [encoding] then sends back a json decoded result
  Future<dynamic> postForm(String url, List<http.MultipartFile> files, {Map<String, String>? headers, body}) async {
    if(kDebugMode){
      log(url); log(json.encode(headers)); log(json.encode(body));
    }
    try {
      headers!['Content-Type'] = 'multipart/form-data';
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.fields.addAll(body!);
      request.files.addAll(files);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final int statusCode = response.statusCode;
      final dynamic res = json.decode(response.body);
      if(kDebugMode) log(res.toString().toString());
      if (statusCode < 200 || statusCode > 400) throw res['msg'];
      return res;
    } catch (e) {
      rethrow;
    }
  }

  /// A function to do any put request with the [url], [headers], [body]
  /// and [encoding] then sends back a json decoded result
  Future<dynamic> put(String url, {Map<String, String>? headers, body}) {
    if(kDebugMode){
      log(url); log(json.encode(headers)); log(json.encode(body));
    }
    try {
      headers!['Content-Type'] = 'application/json';
      return http
          .put(Uri.parse(url), body: json.encode(body), headers: headers)
          .then((http.Response response) {
        final String res = response.body;
        if(kDebugMode) log(res.toString());
        final int statusCode = response.statusCode;
        var result = _decoder.convert(res);
        if (statusCode < 200 || statusCode > 400) throw result['msg'];
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  /// A function to do any patch request with the [url], [headers], [body]
  /// and [encoding] then sends back a json decoded result
  Future<dynamic> patch(String url, {Map<String, String>? headers, body}) {
    if(kDebugMode){
      log(url); log(json.encode(headers)); log(json.encode(body));
    }
    try {
      headers!['Content-Type'] = 'application/json';
      return http
          .patch(Uri.parse(url), body: json.encode(body), headers: headers)
          .then((http.Response response) {
        final String res = response.body;
        if(kDebugMode) log(res.toString());
        final int statusCode = response.statusCode;
        var result = _decoder.convert(res);
        if (statusCode < 200 || statusCode > 400) throw result['msg'];
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

  /// A function to do any delete request with the [url] and [headers]
  /// then sends back a json decoded result
  Future<dynamic> delete(String url, {Map<String, String>? headers}) {
    if(kDebugMode){
      log(url); log(json.encode(headers));
    }
    try {
      headers!['Content-Type'] = 'application/json';
      return http
          .delete(Uri.parse(url), headers: headers)
          .then((http.Response response) {
        final String res = response.body;
        if(kDebugMode) log(res.toString());
        final int statusCode = response.statusCode;
        var result = _decoder.convert(res);
        if (statusCode < 200 || statusCode > 400) throw result['msg'];
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }

}

