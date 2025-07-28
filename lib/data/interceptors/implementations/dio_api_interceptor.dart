// ignore_for_file: use_string_buffers

import 'dart:developer';

import 'package:conectar_users_fe/data/interceptors/interfaces/api_interceptor.dart';
import 'package:conectar_users_fe/data/services/implementations/auth_redirect_impl.dart';
import 'package:dio/dio.dart';

class DioApiInteceptorImpl implements ApiInterceptor<Interceptor> {
  @override
  InterceptorsWrapper get interceptor => InterceptorsWrapper(
    onRequest: (options, handler) {
      log('URL: ${options.baseUrl}${options.path}', name: 'REQUEST INTECEPTOR');

      return handler.next(options);
    },
    onResponse: (response, handler) {
      log(
        '[${response.statusCode}] - ${response.realUri}',
        name: 'RESPONSE INTERCEPTOR',
      );

      return handler.next(response);
    },
    onError: (DioException error, handler) {
      if (error.response != null) {
        log(
          '[${error.response?.statusCode}] - ${error.response?.data}',
          name: 'ERROR INTERCEPTOR',
        );
      } else if (error.type == DioExceptionType.receiveTimeout) {
        log('Tempo de resposta excedido', name: 'ERROR INTERCEPTOR');
      } else {
        log(
          'Sem resposta do servidor |'
          ' [${error.response?.statusCode}]'
          ' - ${error.message}',
          name: 'ERROR INTERCEPTOR',
        );
      }
      final statusCode = error.response?.statusCode;
      final errorMessage = _getMessage(error, statusCode);

      if (statusCode == 401) {
        AuthRedirectImpl().notifyUnauthorized();
      }

      return handler.reject(
        DioException(
          requestOptions: error.requestOptions,
          message: errorMessage,
        ),
      );
    },
  );
  String _getMessage(DioException error, int? statusCode) {
    String? message = error.response == null
        ? null
        : error.response?.data == ''
        ? null
        : error.response?.data['message'];

    if (error.response != null &&
        error.response?.data != '' &&
        error.response?.data.containsKey('error') &&
        error.response?.data['error'] != null) {
      final element = error.response!.data['error'];
      message = '$message $element';
    }

    if (message == 'Unauthorized') {
      message == null;
    }

    return switch (error.type) {
      DioExceptionType.connectionTimeout =>
        message ??
            'Parece que a conexão está demorando mais '
                'do que o esperado. Tente novamente em alguns instantes.',
      DioExceptionType.sendTimeout =>
        message ??
            'O envio dos dados demorou demais. '
                'Verifique sua conexão e tente novamente.',
      DioExceptionType.receiveTimeout =>
        message ??
            'Não conseguimos obter uma resposta a tempo. '
                'Por favor, verifique sua conexão e tente novamente.',
      DioExceptionType.badCertificate =>
        message ??
            'Houve um problema de segurança '
                'com o certificado. Tente mais tarde.',
      DioExceptionType.badResponse => switch (statusCode) {
        400 =>
          message ??
              'A requisição não foi entendida. '
                  'Verifique os dados e tente novamente.',
        401 =>
          'Você não tem permissão para acessar este recurso. '
              'Por favor, verifique suas credenciais.',
        403 =>
          message ??
              'Você não tem acesso a esta área. '
                  'Entre em contato com o suporte.',
        404 =>
          message ??
              'Não encontramos o que você procurava. '
                  'Pode ser que o recurso tenha sido removido ou não exista.',
        500 =>
          message ??
              'Ocorreu um erro interno no servidor. '
                  'Tente novamente mais tarde.',
        _ =>
          message ??
              'Ocorreu um erro inesperado. '
                  'Tente novamente ou entre em contato com o suporte.',
      },
      DioExceptionType.cancel =>
        message ??
            'A requisição foi cancelada. '
                'Verifique sua conexão ou tente novamente.',
      DioExceptionType.connectionError =>
        message ??
            'Houve um problema de conexão. '
                'Verifique sua internet e tente novamente.',
      DioExceptionType.unknown =>
        message ??
            'Algo deu errado. Tente novamente '
                'ou entre em contato com o suporte.',
    };
  }
}
