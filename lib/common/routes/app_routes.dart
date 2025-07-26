import 'package:conectar_users_fe/presentation/views/auth/login_view.dart';
import 'package:conectar_users_fe/presentation/views/clients/clients_list_view.dart';
import 'package:conectar_users_fe/presentation/views/clients/clients_view.dart';
import 'package:conectar_users_fe/presentation/views/home/home_view.dart';
import 'package:conectar_users_fe/presentation/views/users/users_view.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routerNeglect: true,
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => const LoginView(),
    ),

    ShellRoute(
      builder: (_, __, child) => HomeView(child: child),
      routes: [
        ShellRoute(
          builder: (context, state, child) => ClientsView(child: child),
          routes: [
            GoRoute(
              path: '/clients/list',
              builder: (context, state) => ClientsListView(),
            ),
          ],
        ),
        GoRoute(path: '/users', builder: (context, state) => UsersView()),
      ],
    ),
  ],
);
