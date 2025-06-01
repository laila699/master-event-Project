import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'token_storage.dart';

class DioClient {
  static late final Dio dio;

  static Future<void> init(TokenStorage tokenStorage) async {
    final isAndroid = Platform.isAndroid;
    final host = isAndroid ? '172.16.0.120' : '172.16.0.120';
    // On iOS Simulator, localhost will work; on Android emulator you must use 10.0.2.2
    final base = 'http://$host:5000/api';

    dio = Dio(
        BaseOptions(
          baseUrl: 'http://172.16.0.120:5000/api',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final token = await tokenStorage.readToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            return handler.next(options);
          },
        ),
      );
  }
}
