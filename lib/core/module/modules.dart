import 'package:dio/dio.dart';
import 'package:dotenv/dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class ThirdPartyModule {
  DotEnv getEnv() {
    final env = DotEnv(includePlatformEnvironment: true)..load(['.env']);
    return env;
  }

  Dio mainDioClient() {
    final baseUrl = getEnv()['BASE_URL']!;

    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        sendTimeout: const Duration(minutes: 2),
      ),
    );

    dio.interceptors
      ..add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      )
      ..add(
        PrettyDioLogger(
          requestBody: true,
        ),
      );

    return dio;
  }
}
