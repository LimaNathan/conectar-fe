import 'package:conectar_users_fe/data/repositories/implementations/auth/remote_auth_repository.dart';
import 'package:conectar_users_fe/data/repositories/implementations/auth/remote_clients_repository.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/auth/auth_repository.dart';
import 'package:conectar_users_fe/data/repositories/interfaces/clients/clients_repository.dart';
import 'package:conectar_users_fe/data/services/implementations/dio_api_impl.dart';
import 'package:conectar_users_fe/data/services/implementations/local_storage_impl.dart';
import 'package:conectar_users_fe/data/services/interfaces/api_interface.dart';
import 'package:conectar_users_fe/data/services/interfaces/local_storage_interface.dart';
import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:conectar_users_fe/presentation/viewmodels/clients/client_viewmodel.dart';
import 'package:conectar_users_fe/presentation/viewmodels/user/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  Provider<LocalStorageInterface>(create: (_) => LocalStorageImpl()),

  Provider<ApiInterface>(create: (context) => DioApiImpl(context.read())),

  Provider<AuthRepository>(
    create: (context) => RemoteAuthRepository(context.read(), context.read()),
  ),

  Provider<ClientsRepository>(
    create: (context) => RemoteClientsRepository(context.read()),
  ),
  ChangeNotifierProvider(create: (context) => LoginViewmodel(context.read())),
  ChangeNotifierProvider(
    create: (context) => ClientViewmodel(context.read(), context.read()),
  ),
  ChangeNotifierProvider(
    create: (context) => UserViewmodel(context.read(), context.read()),
  ),
];
