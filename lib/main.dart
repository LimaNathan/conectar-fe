import 'package:conectar_users_fe/common/providers/app_providers.dart';
import 'package:conectar_users_fe/common/routes/app_routes.dart';
import 'package:conectar_users_fe/data/services/implementations/auth_redirect_impl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ShadApp.router(
        routerConfig: appRouter,
        title: 'Conéctar',
        builder: (context, child) {
          final authService = AuthRedirectImpl();

          if (authService.unauthorized) {
            authService.reset();
            context.go('/');
          }

          return child ?? Container();
        },
        theme: ShadThemeData(
          brightness: Brightness.light,
          cardTheme: ShadCardTheme(
            border: Border.all(color: Colors.transparent),
          ),
          colorScheme: ShadGreenColorScheme.light(
            primary: Color(0xff19af78),
            primaryForeground: Color(0xff8cd7b9),
            accent: Color(0xffe1f5f0),
            background: Color(0xfffafafa),
          ),
        ),
      ),
    );
  }
}
