import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/common/utils/reponsivity_util.dart';
import 'package:conectar_users_fe/models/utils/device_screen_type_enum.dart';
import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:conectar_users_fe/presentation/views/auth/components/auth_form_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewmodel _loginViewModel;

  @override
  void initState() {
    super.initState();
    _loginViewModel = context.read<LoginViewmodel>();
    _loginViewModel.loginCommand.addListener(_onLoginResult);
  }

  @override
  void dispose() {
    _loginViewModel.loginCommand.removeListener(_onLoginResult);
    super.dispose();
  }

  void _onLoginResult() {
    if (_loginViewModel.loginCommand.isSuccess) {
      ShadToaster.of(context).show(
        const ShadToast(
          title: Text('Sucesso!'),
          description: Text('Login realizado com sucesso.'),
        ),
      );
      context.go('/clients/list');
    } else if (_loginViewModel.loginCommand.hasError) {
      ShadToaster.of(context).show(
        ShadToast.destructive(
          title: const Text('Erro no Login'),
          description: Text(
            (_loginViewModel.loginCommand.result as Error).exception.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final DeviceScreenType responsivityUtil = ResponsivityUtil().getDeviceType(
      context,
    );

    return Scaffold(
      backgroundColor: responsivityUtil == DeviceScreenType.mobile
          ? Colors.white
          : ShadTheme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: size.width * .02,
          children: [
            Image.asset(
              'assets/logo_conectar.png',
              color: responsivityUtil == DeviceScreenType.mobile
                  ? ShadTheme.of(context).colorScheme.primary
                  : Colors.white,
            ),

            if (responsivityUtil != DeviceScreenType.mobile)
              ShadCard(
                width: switch (responsivityUtil) {
                  DeviceScreenType.tablet => size.width * .45,
                  DeviceScreenType.desktop => size.width * .33,
                  _ => size.width * .25,
                },
                child: AuthFormComponent(),
              ),
            if (responsivityUtil == DeviceScreenType.mobile)
              Padding(
                padding: EdgeInsets.all(size.width * .15),
                child: AuthFormComponent(),
              ),
          ],
        ),
      ),
    );
  }
}
