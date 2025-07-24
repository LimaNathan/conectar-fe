import 'package:conectar_users_fe/presentation/views/auth/login_view.dart';
import 'package:conectar_users_fe/presentation/views/home/home_view.dart';

import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
  ],
);
