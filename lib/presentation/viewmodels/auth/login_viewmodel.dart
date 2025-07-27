import 'dart:developer';

import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/auth/auth_repository.dart';
import 'package:conectar_users_fe/data/repositories/tokenization.dart';
import 'package:conectar_users_fe/models/auth/dto/credentials.dart';
import 'package:conectar_users_fe/models/auth/dto/user_dto.dart';
import 'package:conectar_users_fe/models/auth/user_details.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/foundation.dart';

class LoginViewmodel with ChangeNotifier {
  LoginViewmodel(this._authRepository) {
    loginCommand = Command1(_login);
    registerCommand = Command1(_register);
    getUserDetailsCommand = Command0(_getUser);
  }
  late final Command1<String, CreateUserDTO> registerCommand;
  late final Command1<void, Credentials> loginCommand;
  late final Command0<UserDetails> getUserDetailsCommand;
  final AuthRepository _authRepository;

  Future<Result<UserDetails>> _getUser() async {
    try {
      final token = await _authRepository.currentUser();
      final decodedToken = JWT.decode(
        (token as Ok<Tokenization>).value.accessToken,
      );
      return Ok(UserDetails.fromMap(decodedToken.payload));
    } catch (e) {
      log('Erro ao buscar o payload do usuário: $e');
      return Error(e);
    }
  }

  Future<Result> _login(Credentials credentials) async {
    return await _authRepository.signIn(credentials);
  }

  Future<Result<String>> _register(CreateUserDTO user) async {
    return await _authRepository.register(user);
  }
}
