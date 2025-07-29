import 'package:conectar_users_fe/data/repositories/interfaces/credentials_validator.dart';
import 'package:conectar_users_fe/models/auth/dto/credentials.dart';
import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AuthFormComponent extends StatefulWidget {
  const AuthFormComponent({super.key});

  @override
  State<AuthFormComponent> createState() => _AuthFormComponentState();
}

class _AuthFormComponentState extends State<AuthFormComponent> {
  late final LoginViewmodel vm;
  final _formKey = GlobalKey<ShadFormState>();
  Credentials _credentials = Credentials(email: '', password: '');
  final _credentialsValidator = CredentialsValidator();
  bool _isPasswordVisible = false;
  var iconColor = Color(0xff19af78);

  @override
  void initState() {
    super.initState();
    vm = context.read<LoginViewmodel>();
  }

  onSend() {
    if (_formKey.currentState?.validate() ?? false) {
      vm.loginCommand.call(_credentials);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;

    return ShadForm(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShadInputFormField(
            id: 'email',
            label: Text('Email', style: ShadTheme.of(context).textTheme.small),
            placeholder: const Text('Digite seu email'),
            autovalidateMode: AutovalidateMode.onUnfocus,
            keyboardType: TextInputType.emailAddress,
            onSubmitted: (value) => onSend(),

            onChanged: (value) {
              setState(() {
                _credentials = _credentials.copyWith(email: value);
              });
            },
            validator: _credentialsValidator.byField(_credentials, 'email'),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 5,
                child: ShadInputFormField(
                  autovalidateMode: AutovalidateMode.disabled,
                  id: 'password',
                  label: Text(
                    'Senha',
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                  onSubmitted: (value) => onSend(),

                  placeholder: const Text('Digite sua senha'),
                  obscureText: !_isPasswordVisible,
                  onChanged: (value) {
                    setState(() {
                      _credentials = _credentials.copyWith(password: value);
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primaryForeground,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  child: ShadButton(
                    onHoverChange: (value) => setState(
                      () => iconColor = value
                          ? Colors.white
                          : colorScheme.primary,
                    ),
                    backgroundColor: colorScheme.primaryForeground,
                    onPressed: () => setState(
                      () => _isPasswordVisible = !_isPasswordVisible,
                    ),
                    child: Icon(
                      _isPasswordVisible ? LucideIcons.eyeOff : LucideIcons.eye,
                      size: 16,
                      color: iconColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ListenableBuilder(
            listenable: vm.loginCommand,
            builder: (context, _) {
              return ShadButton(
                width: double.infinity,
                enabled: !vm.loginCommand.running,
                backgroundColor: colorScheme.primary,
                onPressed: onSend,
                child: vm.loginCommand.running
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.foreground,
                        ),
                      )
                    : Text(
                        'Entrar',
                        style: textTheme.small.copyWith(
                          color: colorScheme.accent,
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
