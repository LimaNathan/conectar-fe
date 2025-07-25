import 'package:conectar_users_fe/common/providers/app_providers.dart';
import 'package:conectar_users_fe/common/routes/app_routes.dart';
import 'package:flutter/material.dart';
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
        theme: ShadThemeData(
          brightness: Brightness.light,
          colorScheme: ShadGreenColorScheme.light(
            primary: Color(0xff19af78),
            primaryForeground: Color(0xff8cd7b9),
          ),
        ),
      ),
    );
  }
}
