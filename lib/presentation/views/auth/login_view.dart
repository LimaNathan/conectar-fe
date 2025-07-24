import 'package:conectar_users_fe/data/repositories/interfaces/credentials_validator.dart';
import 'package:conectar_users_fe/models/auth/credentials.dart';
import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:conectar_users_fe/common/commands/command_pattern.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewModel _loginViewModel;
  final _formKey = GlobalKey<ShadFormState>();
  Credentials _credentials = Credentials(email: '', password: '');
  final _credentialsValidator = CredentialsValidator();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _loginViewModel = context.read<LoginViewModel>();
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
      context.go('/home');
    } else if (_loginViewModel.loginCommand.hasError) {
      ShadToaster.of(context).show(
        ShadToast.destructive(
          title: const Text('Erro no Login'),
          description: Text(
            (_loginViewModel.loginCommand.result as Error).toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadCard(
          width: 350,
          title: const Text('Login'),
          description: const Text('Entre com suas credenciais para acessar.'),
          child: ShadForm(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadInputFormField(
                  id: 'email',
                  label: const Text('Email'),
                  placeholder: const Text('Digite seu email'),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      _credentials = _credentials.copyWith(email: value);
                    });
                  },
                  validator: _credentialsValidator.byField(
                    _credentials,
                    'email',
                  ),
                ),
                const SizedBox(height: 16),
                ShadInputFormField(
                  id: 'password',
                  label: const Text('Senha'),
                  placeholder: const Text('Digite sua senha'),
                  obscureText: !_isPasswordVisible,
                  onChanged: (value) {
                    setState(() {
                      _credentials = _credentials.copyWith(password: value);
                    });
                  },
                  validator: _credentialsValidator.byField(
                    _credentials,
                    'password',
                  ),
                  trailing: ShadButton.ghost(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible ? LucideIcons.eyeOff : LucideIcons.eye,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Consumer<LoginViewModel>(
                  builder: (context, vm, child) {
                    return ShadButton(
                      width: double.infinity,
                      onPressed: vm.loginCommand.running
                          ? null
                          : () {
                              if (_formKey.currentState?.validate() ?? false) {
                                vm.loginCommand.call(_credentials);
                              }
                            },
                      child: vm.loginCommand.running
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Entrar'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
