import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/clients/dto/client_dto.dart';
import 'package:conectar_users_fe/models/clients/dto/clients_pagination_query.dart';
import 'package:conectar_users_fe/models/clients/dto/via_cep_result_dto.dart';
import 'package:conectar_users_fe/models/clients/pagination_result.dart';

abstract interface class ClientsRepository {
  Future<Result<ClientDTO>> create(CreateClientDTO client);
  Future<Result<ClientPaginationResult>> getAll(ClientsPaginationQuery query);
  Future<Result<ClientDTO>> update(int clientId, UpdateClientDTO client);
  Future<Result> delete(int clientId);
  Future<Result> addUserToClient(int userId, int clientId);
  Future<Result<ViaCepResultDto>> findByZIPCode(String zip);
}
