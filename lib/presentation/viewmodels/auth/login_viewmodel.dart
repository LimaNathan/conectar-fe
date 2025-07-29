import 'dart:async';

import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/auth/auth_repository.dart';
import 'package:conectar_users_fe/models/auth/dto/credentials.dart';
import 'package:flutter/foundation.dart';

class LoginViewmodel with ChangeNotifier {
  LoginViewmodel(this._authRepository) {
    loginCommand = Command1(_login);
    logoutCommand = Command0(_logout);
  }
  late final Command1<void, Credentials> loginCommand;
  late final Command0<void> logoutCommand;

  final AuthRepository _authRepository;

  Future<Result> _logout() async {
    return Ok(_authRepository.singOut());
  }

  Future<Result> _login(Credentials credentials) async {
    final response = await _authRepository.signIn(credentials);
    return response;
  }
}
