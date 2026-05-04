import 'dart:io';
import 'package:basic_diet/data/network/failure.dart';
import 'package:basic_diet/presentation/resources/strings_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ExceptionHandler implements Exception {
  late Failure failure;

  ExceptionHandler.handle(dynamic exception) {
    if (exception is DioException) {
      failure = _handleException(exception);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.badRequest.getFailure();
    case DioExceptionType.badResponse:
      if (exception.response != null &&
          exception.response?.statusCode != null &&
          exception.response?.statusMessage != null) {
        return Failure(
          exception.response!.statusCode!,
          exception.response!.statusMessage!,
        );
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();
    case DioExceptionType.unknown:
      debugPrint("Unknown DioException: ${exception.error}");
      if (exception.error is SocketException) {
        return DataSource.noInternetConnection.getFailure();
      }
      return DataSource.defaultError.getFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return Failure(ResponseCode.noContent, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseMessage.internalServerError,
        );
      case DataSource.connectTimeout:
        return Failure(
          ResponseCode.connectTimeout,
          ResponseMessage.connectTimeout,
        );
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout,
          ResponseMessage.receiveTimeout,
        );
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
          ResponseCode.noInternetConnection,
          ResponseMessage.noInternetConnection,
        );
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorised = 401;
  static const int forbidden = 403;
  static const int internalServerError = 500;
  static const int notFound = 404;

  // local status codes
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cancelError = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
  static const int defaultError = -8;
}

class ResponseMessage {
  static String success = Strings.success;
  static String noContent = Strings.noContent;
  static String badRequest = Strings.badRequest;
  static String unauthorised = Strings.unauthorized;
  static String forbidden = Strings.forbidden;
  static String internalServerError = Strings.internalServerError;
  static String notFound = Strings.notFound;

  // local status codes
  static String connectTimeout = Strings.timeout;
  static String cancel = Strings.defaultError;
  static String receiveTimeout = Strings.timeout;
  static String sendTimeout = Strings.timeout;
  static String cancelError = Strings.defaultError;
  static String cacheError = Strings.cacheError;
  static String noInternetConnection = Strings.noInternet;
  static String defaultError = Strings.defaultError;
}

class ApiInternalStatus {
  static const int success = 0, failure = 1;
}
