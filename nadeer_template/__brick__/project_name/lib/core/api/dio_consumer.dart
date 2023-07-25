import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../app/injection_container.dart' as di;
import '../error/error_handler.dart';
import 'api_consumer.dart';
import 'app_interceptors.dart';
import 'end_points.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client, SecurityContext? securityContext}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      if (EndPoints.isTesting) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      }
      final HttpClient newClient = HttpClient(context: securityContext);
      newClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        print("badCertificateCallback ");
        print("host : $host");
        print("port : $port");
        return false;
      };
      return newClient;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < ResponseCode.badRequest;
      };
    // Add any thing in header  Example header token
    client.interceptors.add(di.instance<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.instance<LogInterceptor>());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      throw ErrorHandler.handle(error);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
        options: Options(
          headers: headers,
        ),
      );
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      throw ErrorHandler.handle(error);
    }
  }

  @override
  Future delete(String path,
      {Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.delete(path,
          queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      throw ErrorHandler.handle(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.put(path, queryParameters: queryParameters, data: body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      throw ErrorHandler.handle(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final data = response.data.toString().trim();
    if (data.isNotEmpty) {
      final responseJson = jsonDecode(data);

      if (response.statusCode == null || (response.statusCode ?? 500) > 203) {
        throw DioError(
          requestOptions: response.requestOptions,
          error: "Message",
          response: response,
          type: DioErrorType.response,
        );
      }

      return responseJson;
    }
    return;
  }
}
