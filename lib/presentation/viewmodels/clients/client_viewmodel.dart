import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/clients/clients_repository.dart';
import 'package:conectar_users_fe/models/clients/dto/client_dto.dart';
import 'package:conectar_users_fe/models/clients/dto/clients_pagination_query.dart';
import 'package:conectar_users_fe/models/clients/pagination_result.dart';
import 'package:flutter/cupertino.dart';

class ClientViewmodel extends ChangeNotifier {
  ClientViewmodel(this._repository) {
    createCommand = Command1(_create);
    getAllCommand = Command1(_getAll);
    updateCommand = Command2(_update);
    deleteCommand = Command1(_delete);
    addtoUserCommand = Command2(_addUserToClient);
  }

  final ClientsRepository _repository;

  late final Command1<ClientDTO, CreateClientDTO> createCommand;
  late final Command1<ClientPaginationResult, ClientsPaginationQuery>
  getAllCommand;
  late final Command2<ClientDTO, int, UpdateClientDTO> updateCommand;
  late final Command1<void, int> deleteCommand;
  late final Command2<void, int, int> addtoUserCommand;

  Future<Result<ClientDTO>> _create(CreateClientDTO data) async {
    return await _repository.create(data);
  }

  Future<Result<ClientPaginationResult>> _getAll(
    ClientsPaginationQuery query,
  ) async {
    return await _repository.getAll(query);
  }

  Future<Result<ClientDTO>> _update(
    int clientId,
    UpdateClientDTO client,
  ) async {
    return await _repository.update(clientId, client);
  }

  Future<Result> _delete(int clientId) async {
    return await _repository.delete(clientId);
  }

  Future<Result> _addUserToClient(int clientId, int userId) async {
    return await _repository.addUserToClient(userId, clientId);
  }
}
