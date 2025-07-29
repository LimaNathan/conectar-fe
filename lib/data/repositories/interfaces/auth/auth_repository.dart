import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/data/repositories/tokenization.dart';
import 'package:conectar_users_fe/models/auth/dto/credentials.dart';
import 'package:conectar_users_fe/models/auth/dto/user_dto.dart';
import 'package:conectar_users_fe/models/users/dto/user_pagination_query.dart';
import 'package:conectar_users_fe/models/users/user_pagination_result.dart';

abstract interface class AuthRepository {
  Future<Result<Tokenization>> signIn(Credentials credentials);
  Future<Result<String>> register(CreateUserDTO userr);
  Future<void> singOut();
  Future<Result> deleteUser(int userId);
  Future<Result<Tokenization>> currentUser();
  Future<Result> updateUser(int userId, UpdateUserDTO data);
  Future<Result<UserPaginationResult>> getAll(UserPaginationQuery query);
}
