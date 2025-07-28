import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/common/endpoints/endpoints.dart';
import 'package:conectar_users_fe/common/exceptions/app_exception.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/auth/auth_repository.dart';
import 'package:conectar_users_fe/data/repositories/tokenization.dart';
import 'package:conectar_users_fe/data/services/interfaces/api_interface.dart';
import 'package:conectar_users_fe/data/services/interfaces/local_storage_interface.dart';
import 'package:conectar_users_fe/models/auth/dto/credentials.dart';
import 'package:conectar_users_fe/models/auth/dto/user_dto.dart';
import 'package:dio/dio.dart';

class RemoteAuthRepository implements AuthRepository {
  RemoteAuthRepository(this._api, this._localStorage);
  final ApiInterface _api;
  final LocalStorageInterface _localStorage;
  @override
  Future<Result<String>> register(CreateUserDTO user) async {
    try {
      await _api.post(
        Endpoints.register,
        data: user.toJson().remove('runtimeType'),
      );
      return Ok('Usuário criado com sucesso!');
    } on DioException catch (e) {
      return Error(e.message ?? 'Houve um erro inesperado');
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<Result<Tokenization>> signIn(Credentials credentials) async {
    try {
      final response = await _api.post(
        Endpoints.login,
        data: credentials.toJson(),
      );

      await _localStorage.writeValue(
        'access_token',
        response.data['access_token'],
      );

      return Ok(Tokenization.fromJson(response.data));
    } on DioException catch (e) {
      return Error(e.message ?? 'Houve um erro inesperado');
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<Result<Tokenization>> currentUser() async {
    final currentUserToken = await _localStorage.getValue('access_token');

    if (currentUserToken == null) {
      return Error(
        AppException('Nenhum usuário encontrado, faça o login novamente.'),
      );
    }
    return Ok(Tokenization(accessToken: currentUserToken));
  }

  @override
  Future<void> singOut() async {
    await _localStorage.delete('access_token');
  }
}
