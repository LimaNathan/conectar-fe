import 'dart:developer';
import 'dart:io';

import 'package:conectar_users_fe/data/interceptors/implementations/dio_api_interceptor.dart';
import 'package:conectar_users_fe/data/services/interfaces/api_interface.dart';
import 'package:conectar_users_fe/data/services/interfaces/local_storage_interface.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DioApiImpl implements ApiInterface<Response?> {
  DioApiImpl(this._localStorage) {
    _dio.options = BaseOptions(
      headers: {..._dio.options.headers, 'Content-Type': 'application/json'},
      baseUrl: _baseUrl,
      connectTimeout: 10.seconds,
    );
    _dio.interceptors.addAll([
      DioApiInteceptorImpl().interceptor,
      RetryInterceptor(
        dio: _dio,
        retryDelays: [2.seconds],
        logPrint: (message) {
          return log(message, name: 'RETRY INTERCEPTOR');
        },
      ),
    ]);
  }

  final _dio = Dio();
  static const String _baseUrl = String.fromEnvironment('BASE_URL');
  final LocalStorageInterface _localStorage;

  final _headers = {};

  Future _checkHeaders() async {
    if (!_headers.containsKey(HttpHeaders.authorizationHeader)) {
      final String? token = await _localStorage.getValue('access_token');

      if (token != null) {
        _headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $token'});
      }
    }
  }

  @override
  Future<Response?> delete(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParms,
  }) async {
    try {
      await _checkHeaders();
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParms,
      );

      return response;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<Response?> get(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParms,
  }) async {
    try {
      await _checkHeaders();

      final response = await _dio.get(
        url,
        data: data,
        queryParameters: queryParms,
      );

      return response;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<Response?> post(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParms,
  }) async {
    try {
      await _checkHeaders();

      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParms,
      );

      return response;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<Response?> put(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParms,
  }) async {
    try {
      await _checkHeaders();

      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParms,
      );

      return response;
    } on DioException {
      rethrow;
    }
  }
}
