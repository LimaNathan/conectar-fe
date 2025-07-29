import 'dart:developer';

import 'package:conectar_users_fe/common/endpoints/endpoints.dart';
import 'package:conectar_users_fe/common/exceptions/app_exception.dart';
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

      connectTimeout: 20.seconds,
    );
    _dio.interceptors.addAll([
      DioApiInteceptorImpl().interceptor,
      RetryInterceptor(
        dio: _dio,
        retries: 5,

        retryDelays: [2.seconds, 2.seconds, 2.seconds, 2.seconds, 2.seconds],
        logPrint: (message) {
          return log(message, name: 'RETRY INTERCEPTOR');
        },
      ),
    ]);
  }

  final _dio = Dio();
  final LocalStorageInterface _localStorage;

  Future _checkHeaders({String? path}) async {
    if (!_dio.options.headers.containsKey('Authorization')) {
      log('Não tem o authorization no header, buscando...', name: 'DIO');
      final String? token = await _localStorage.getValue('access_token');

      if (token != null) {
        log('Token encontrado, adicionando aos headers...', name: 'DIO');
        final tokenHeader = {'Authorization': 'Bearer $token'};
        log('   $tokenHeader', name: 'DIO');
        _dio.options.headers.addAll(tokenHeader);

        if (_dio.options.headers.containsKey('Authorization')) {
          log('Header adicionado com sucesso!', name: 'DIO');
        } else {
          log(
            'O header `Authorization` não foi adicionado aos demais headers',
            name: 'DIO',
          );
        }
      } else {
        log('Não tem token...', name: 'DIO');
        log('path: $path');
        if (path != Endpoints.login) {
          throw UnauthorizedException(
            'Sessão expirada, faça o login novamente',
          );
        }
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
      await _checkHeaders(path: url);
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
    bool? withoutBaseURL,
  }) async {
    try {
      await _checkHeaders(path: url);

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
      await _checkHeaders(path: url);

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
      await _checkHeaders(path: url);

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
