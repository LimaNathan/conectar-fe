import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/data/repositories/tokenization.dart';
import 'package:conectar_users_fe/models/auth/dto/credentials.dart';
import 'package:conectar_users_fe/models/auth/dto/user_dto.dart';

abstract interface class AuthRepository {
  Future<Result<Tokenization>> signIn(Credentials credentials);
  Future<Result<String>> register(CreateUserDTO userr);
  Future<void> singOut();
  Future<Result<Tokenization>> currentUser();
}
