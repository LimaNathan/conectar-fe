import 'dart:async';

import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/common/exceptions/app_exception.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/auth/auth_repository.dart';
import 'package:conectar_users_fe/data/repositories/tokenization.dart';
import 'package:conectar_users_fe/models/auth/dto/user_dto.dart';
import 'package:conectar_users_fe/models/auth/user_details.dart';
import 'package:conectar_users_fe/models/users/dto/user_pagination_query.dart';
import 'package:conectar_users_fe/models/users/user_pagination_result.dart';
import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';

class UserViewmodel extends ChangeNotifier {
  UserViewmodel(this._repository, this._loginViewmodel) {
    deleteUserCommand = Command1(_deleteUser);
    registerCommand = Command1(_register);
    updateCommand = Command2(_update);
    getUserDetailsCommand = Command0(_getUser);
    getAllCommand = Command0(_getAll);
  }

  final AuthRepository _repository;
  final LoginViewmodel _loginViewmodel;
  late final Command1<void, int> deleteUserCommand;
  late final Command1<String, CreateUserDTO> registerCommand;
  late final Command2<void, int, UpdateUserDTO> updateCommand;
  late final Command0<UserDetails> getUserDetailsCommand;
  late final Command0<UserPaginationResult> getAllCommand;

  final userController = StreamController<UserDetails?>();

  final UserPaginationQuery query = UserPaginationQuery(
    page: 1,
    size: 10,
    order: OrderDirection.desc,
  );

  Future<Result> _deleteUser(int userId) async {
    try {
      return await _repository.deleteUser(userId);
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }

  Future<Result<String>> _register(CreateUserDTO user) async {
    try {
      final response = await _repository.register(user);
      getAllCommand.call();
      return response;
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }

  Future<Result> _update(int userId, UpdateUserDTO data) async {
    try {
      final response = _repository.updateUser(userId, data);
      getUserDetailsCommand.call();
      return response;
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }

  Future<Result<UserPaginationResult>> _getAll() async {
    try {
      return await _repository.getAll(query);
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    }
  }

  Future<Result<UserDetails>> _getUser() async {
    try {
      final userDetails = await _getUserDetails();

      userController.add(userDetails);
      return Ok(userDetails);
    } on UnauthorizedException catch (e) {
      _loginViewmodel.logoutCommand.call();
      return Error(e);
    } catch (e) {
      return Error(e);
    }
  }

  Future<UserDetails> _getUserDetails() async {
    final token = await _repository.currentUser();
    final decodedToken = JWT.decode(
      (token as Ok<Tokenization>).value.accessToken,
    );

    return UserDetails.fromMap(decodedToken.payload);
  }
}
