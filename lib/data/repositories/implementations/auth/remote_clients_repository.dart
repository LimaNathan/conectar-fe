import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/common/endpoints/endpoints.dart';
import 'package:conectar_users_fe/common/exceptions/app_exception.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/clients/clients_repository.dart';
import 'package:conectar_users_fe/data/services/interfaces/api_interface.dart';
import 'package:conectar_users_fe/models/clients/dto/client_dto.dart';
import 'package:conectar_users_fe/models/clients/dto/clients_pagination_query.dart';
import 'package:conectar_users_fe/models/clients/pagination_result.dart';
import 'package:dio/dio.dart';

class RemoteClientsRepository implements ClientsRepository {
  RemoteClientsRepository(this._api);
  final ApiInterface _api;
  @override
  Future<Result> addUserToClient(int userId, int clientId) async {
    try {
      await _api.put(
        Endpoints.addUserToClient,
        queryParms: {'userId': userId, 'clientId': clientId},
      );

      return Ok(unit);
    } on DioException catch (e) {
      return Error(AppException(e.message ?? 'Houve um erro inesperado'));
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<Result<ClientDTO>> create(CreateClientDTO client) async {
    try {
      final result = await _api.post(
        Endpoints.createClient,
        data: client.toJson(),
      );

      return Ok(ClientDTO.fromJson(result.data));
    } on DioException catch (e) {
      return Error(AppException(e.message ?? 'Houve um erro inesperado'));
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<Result> delete(int clientId) async {
    try {
      await _api.post(Endpoints.deleteClient, queryParms: {'id': clientId});

      return Ok(unit);
    } on DioException catch (e) {
      return Error(AppException(e.message ?? 'Houve um erro inesperado'));
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<Result<ClientPaginationResult>> getAll(
    ClientsPaginationQuery query,
  ) async {
    try {
      final result = await _api.get(
        Endpoints.clientPaginated,
        queryParms: query.toJson(),
      );

      return Ok(ClientPaginationResult.fromJson(result.data));
    } on DioException catch (e) {
      return Error(AppException(e.message ?? 'Houve um erro inesperado'));
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<Result<ClientDTO>> update(int clientId, UpdateClientDTO client) async {
    try {
      final result = await _api.put(
        Endpoints.updateClient(clientId),
        data: client.toJson(),
      );

      return Ok(ClientDTO.fromJson(result.data));
    } on DioException catch (e) {
      return Error(AppException(e.message ?? 'Houve um erro inesperado'));
    } catch (e) {
      return Error(e.toString());
    }
  }
}
