import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/auth/auth_repository.dart';
import 'package:conectar_users_fe/models/auth/dto/credentials.dart';
import 'package:conectar_users_fe/models/auth/dto/user_dto.dart';
import 'package:flutter/foundation.dart';

class LoginViewmodel with ChangeNotifier {
  LoginViewmodel(this._authRepository) {
    loginCommand = Command1(_login);
    registerCommand = Command1(_register);
  }
  late final Command1<String, CreateUserDTO> registerCommand;
  late final Command1<void, Credentials> loginCommand;
  final AuthRepository _authRepository;

  Future<Result> _login(Credentials credentials) async {
    return await _authRepository.signIn(credentials);
  }

  Future<Result<String>> _register(CreateUserDTO user) async {
    return await _authRepository.register(user);
  }
}
