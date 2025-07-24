import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/auth/credentials.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel with ChangeNotifier {
  late final Command1<void, Credentials> loginCommand;

  LoginViewModel() {
    loginCommand = Command1(_login);
  }

  Future<Result> _login(Credentials credentials) async {
    await Future.delayed(const Duration(seconds: 2));

    return const Ok(unit);
  }
}

const unit = Unit();
