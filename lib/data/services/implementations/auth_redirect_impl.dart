import 'package:conectar_users_fe/data/services/interfaces/auth_redirect_interface.dart';
import 'package:flutter/material.dart';

class AuthRedirectImpl extends ChangeNotifier implements AuthRedirectInterface {
  static final AuthRedirectImpl _instance = AuthRedirectImpl._internal();
  factory AuthRedirectImpl() => _instance;
  AuthRedirectImpl._internal();
  bool _unauthorized = false;
  bool get unauthorized => _unauthorized;
  @override
  void notifyUnauthorized() {
    _unauthorized = true;
    notifyListeners();
  }

  @override
  void reset() {
    _unauthorized = false;
    notifyListeners();
  }
}
