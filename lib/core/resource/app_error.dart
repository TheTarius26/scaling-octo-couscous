// ignore_for_file: avoid_dynamic_calls
import 'dart:convert';

import 'package:dio/dio.dart';

enum ErrorCode {
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  methodNotAllowed,
  notAcceptable,
  requestTimeout,
  conflict,
  gone,
  lengthRequired,
  preconditionFailed,
  payloadTooLarge,
  uriTooLong,
  unsupportedMediaType,
  rangeNotSatisfiable,
  expectationFailed,
  imATeapot,
  misdirectedRequest,
  unprocessableEntity,
  locked,
  failedDependency,
  tooEarly,
  upgradeRequired,
  preconditionRequired,
  tooManyRequests,
  requestHeaderFieldsTooLarge,
  unavailableForLegalReasons,
  internalServerError,
  notImplemented,
  badGateway,
  serviceUnavailable,
  gatewayTimeout,
  httpVersionNotSupported,
  variantAlsoNegotiates,
  insufficientStorage,
  loopDetected,
  notExtended,
  networkAuthenticationRequired,
  emptyData,
  buildFailed,
  kafkaError,
  networkError,
  unknownError,
}

class AppError implements Exception {
  AppError({
    required this.data,
    this.message = 'Internal Server Error',
    this.code = ErrorCode.internalServerError,
    this.stack,
  });

  factory AppError.handleError(dynamic error, [StackTrace? stackTrace]) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return AppError(
            message: 'Connection timeout',
            data: error.message,
            code: ErrorCode.requestTimeout,
            stack: stackTrace ?? StackTrace.current,
          );
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          if (statusCode != null) {
            switch (statusCode) {
              case 400:
                return AppError(
                  message: (error.response?.data?['message'] ?? 'Bad Request')
                      .toString(),
                  data: error.response?.data.toString(),
                  code: ErrorCode.badRequest,
                  stack: stackTrace ?? StackTrace.current,
                );
              case 401:
                return AppError(
                  message: (error.response?.data?['message'] ?? 'Unauthorized')
                      .toString(),
                  data: error.response?.data.toString(),
                  code: ErrorCode.unauthorized,
                  stack: stackTrace ?? StackTrace.current,
                );
              case 403:
                return AppError(
                  message: (error.response?.data?['message'] ?? 'Forbidden')
                      .toString(),
                  data: error.response?.data.toString(),
                  code: ErrorCode.forbidden,
                  stack: stackTrace ?? StackTrace.current,
                );
              case 404:
                return AppError(
                  message: (error.response?.data?['message'] ?? 'Not Found')
                      .toString(),
                  data: error.response?.data.toString(),
                  code: ErrorCode.notFound,
                  stack: stackTrace ?? StackTrace.current,
                );
              case 422:
                return AppError(
                  message: (error.response?.data?['message'] ??
                          'Unprocessable Entity')
                      .toString(),
                  data: error.response?.data.toString(),
                  code: ErrorCode.unprocessableEntity,
                  stack: stackTrace ?? StackTrace.current,
                );
              case 500:
                return AppError(
                  message: (error.response?.data?['message'] ??
                          'Internal Server Error')
                      .toString(),
                  data: error.response?.data.toString(),
                  stack: stackTrace ?? StackTrace.current,
                );
              default:
                return AppError(
                  message: (error.response?.data?['message'] ?? 'Unknown Error')
                      .toString(),
                  data: error.response?.data.toString(),
                  code: ErrorCode.unknownError,
                  stack: stackTrace ?? StackTrace.current,
                );
            }
          }
          return AppError(
            message: error.message ?? 'Unknown Error',
            data: error.response?.data.toString(),
            code: ErrorCode.unknownError,
            stack: stackTrace ?? StackTrace.current,
          );
        case DioExceptionType.cancel:
          return AppError(
            message: 'Request cancelled',
            data: error.message,
            code: ErrorCode.unknownError,
            stack: stackTrace ?? StackTrace.current,
          );
        case DioExceptionType.unknown:
          if (error.error is AppError) {
            return (error.error! as AppError).copyWith(
              stack: stackTrace ?? StackTrace.current,
            );
          }
          return AppError(
            message: error.message ?? 'Unknown Error',
            data: error.error.toString(),
            code: ErrorCode.unknownError,
            stack: stackTrace ?? StackTrace.current,
          );
        case DioExceptionType.badCertificate:
          return AppError(
            message: 'Bad certificate',
            data: error.message,
            code: ErrorCode.unknownError,
            stack: stackTrace ?? StackTrace.current,
          );
        case DioExceptionType.connectionError:
          return AppError(
            message: 'Connection error',
            data: error.message,
            code: ErrorCode.networkError,
            stack: stackTrace ?? StackTrace.current,
          );
      }
    }

    if (error is AppError) {
      return error.copyWith(
          stack: stackTrace ?? error.stack ?? StackTrace.current);
    }

    return AppError(
      message: error?.toString() ?? 'Unknown Error',
      data: null,
      code: ErrorCode.unknownError,
      stack: stackTrace ?? StackTrace.current,
    );
  }

  final String message;
  final String? data;
  final ErrorCode code;
  final StackTrace? stack;

  @override
  String toString() => toJson();

  AppError copyWith({
    String? message,
    String? data,
    ErrorCode? code,
    StackTrace? stack,
  }) {
    return AppError(
      message: message ?? this.message,
      data: data ?? this.data,
      code: code ?? this.code,
      stack: stack ?? this.stack,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'data': data,
      'code': code.name,
      'stack': stack?.toString(),
    };
  }

  String toJson() => json.encode(toMap());
}
