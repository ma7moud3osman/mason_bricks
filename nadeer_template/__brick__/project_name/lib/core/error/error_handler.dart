import 'dart:convert';

import 'package:dio/dio.dart';

import '../utils/app_strings.dart';
import 'failures.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else if (error is ErrorHandler) {
      failure = error.failure;
    } else if (error is DataSource) {
      failure = error.getFailure();
    } else if (error is Failure) {
      failure = error;
    } else {
      // default error
      failure = DataSource.defaultValue.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
            error.response?.statusCode ?? ResponseCode.defaultValue,
            jsonDecode(error.response?.data)["message"] ??
                error.response?.statusMessage ??
                ResponseMessage.defaultValue);
      } else {
        return DataSource.defaultValue.getFailure();
      }
    case DioErrorType.cancel:
      return DataSource.cancel.getFailure();
    case DioErrorType.other:
      return Failure(ResponseCode.defaultValue, error.message);
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultValue
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return const Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return const Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return const Failure(
            ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return const Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return const Failure(
            ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSource.notFound:
        return const Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return const Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return const Failure(
            ResponseCode.connectTimeout, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return const Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return const Failure(
            ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return const Failure(
            ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return const Failure(
            ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return const Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.defaultValue:
        return const Failure(
            ResponseCode.defaultValue, ResponseMessage.defaultValue);
    }
  }
}

class ResponseCode {
  // success with data
  static const int success = 200;

  // success with no data (no content)
  static const int noContent = 201;

  // failure, API rejected request
  static const int badRequest = 400;

  // failure, user is not authorised
  static const int unauthorized = 401;

  //  failure, API rejected request
  static const int forbidden = 403;

  // failure, crash in server side
  static const int internalServerError = 500;

  // failure, not found
  static const int notFound = 404;

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultValue = -7;
}

class ResponseMessage {
  // success with data
  static const String success = AppStrings.success;

  // success with no data (no content)
  static const String noContent = AppStrings.success;

  // failure, API rejected request
  static const String badRequest = AppStrings.badRequestError;

  // failure, user is not authorised
  static const String unauthorized = AppStrings.unauthorizedError;

  //  failure, API rejected request
  static const String forbidden = AppStrings.forbiddenError;

  // failure, crash in server side
  static const String internalServerError = AppStrings.internalServerError;

  // failure, crash in server side
  static const String notFound = AppStrings.notFoundError;

  // local status code
  static const String connectTimeout = AppStrings.timeoutError;
  static const String cancel = AppStrings.defaultError;
  static const String receiveTimeout = AppStrings.timeoutError;
  static const String sendTimeout = AppStrings.timeoutError;
  static const String cacheError = AppStrings.cacheError;
  static const String noInternetConnection = AppStrings.noInternetError;
  static const String defaultValue = "ServerError Please Try again";
}
