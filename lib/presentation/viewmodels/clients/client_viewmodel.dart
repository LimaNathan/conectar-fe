import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/common/exceptions/app_exception.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/clients/clients_repository.dart';
import 'package:conectar_users_fe/models/clients/dto/client_dto.dart';
import 'package:conectar_users_fe/models/clients/dto/clients_pagination_query.dart';
import 'package:conectar_users_fe/models/clients/dto/via_cep_result_dto.dart';
import 'package:conectar_users_fe/models/clients/pagination_result.dart';
import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class ClientViewmodel extends ChangeNotifier {
  ClientViewmodel(this._repository, this._loginViewmodel) {
    createCommand = Command1(_create);
    getAllCommand = Command0(_getAll);
    updateCommand = Command2(_update);
    deleteCommand = Command1(_delete);
    addtoUserCommand = Command2(_addUserToClient);
    findByZIPCodeCommand = Command1(_findByZipCode);
  }

  final ClientsRepository _repository;
  final LoginViewmodel _loginViewmodel;

  late final Command1<ClientDTO, CreateClientDTO> createCommand;
  late final Command0<ClientPaginationResult> getAllCommand;
  late final Command2<ClientDTO, int, UpdateClientDTO> updateCommand;
  late final Command1<void, int> deleteCommand;
  late final Command2<void, int, int> addtoUserCommand;
  late final Command1<ViaCepResultDto, String> findByZIPCodeCommand;

  ClientsPaginationQuery query = ClientsPaginationQuery(
    page: 1,
    size: 10,
    order: OrderDirection.desc,
  );

  Future<Result<ViaCepResultDto>> _findByZipCode(String zip) async {
    try {
      return await _repository.findByZIPCode(zip);
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }

  Future<Result<ClientDTO>> _create(CreateClientDTO data) async {
    try {
      final response = await _repository.create(data);
      getAllCommand.call();
      return response;
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }

  Future<Result<ClientPaginationResult>> _getAll() async {
    try {
      return await _repository.getAll(query);
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }

  Future<Result<ClientDTO>> _update(
    int clientId,
    UpdateClientDTO client,
  ) async {
    try {
      final response = await _repository.update(clientId, client);
      getAllCommand.call();
      return response;
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }

  Future<Result> _delete(int clientId) async {
    try {
      final response = await _repository.delete(clientId);
      getAllCommand.call();
      return response;
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }

  Future<Result> _addUserToClient(int clientId, int userId) async {
    try {
      return await _repository.addUserToClient(userId, clientId);
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }
}
