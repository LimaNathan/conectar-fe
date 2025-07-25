import 'package:conectar_users_fe/data/repositories/interfaces/auth/auth_repository.dart';
import 'package:conectar_users_fe/data/services/interfaces/local_storage_interface.dart';
import 'package:conectar_users_fe/presentation/views/auth/login_view.dart';
import 'package:conectar_users_fe/presentation/views/home/home_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final appRouter = GoRouter(
  routerNeglect: true,
  redirect: (context, state) async {
    final currentUser = await context.read<LocalStorageInterface>().getValue('access_token');

    if (currentUser is Error) {
      return '/';
    }
    return state.matchedLocation;
  },

  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),
  ],
);
