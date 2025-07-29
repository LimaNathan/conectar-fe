import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/common/exceptions/app_exception.dart';
import 'package:conectar_users_fe/models/auth/dto/user_dto.dart';
import 'package:conectar_users_fe/models/auth/user_details.dart';
import 'package:conectar_users_fe/models/users/user_role.dart';
import 'package:conectar_users_fe/presentation/viewmodels/auth/login_viewmodel.dart';
import 'package:conectar_users_fe/presentation/viewmodels/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UserDialog extends StatefulWidget {
  final UserDetails? user;

  const UserDialog({super.key, this.user});

  @override
  State<UserDialog> createState() => _UserDialogState();
}

class _UserDialogState extends State<UserDialog> {
  final _formKey = GlobalKey<ShadFormState>();
  late final UserViewmodel userViewmodel;
  bool _isPasswordVisible = false;
  bool isSelf = true;
  bool isAdmin = false;
  final roleController = ShadSelectController<UserRole>();

  var iconColor = Color(0xff19af78);

  // Campos do usuário
  late String _name;
  late String _email;
  late String _password;
  late UserRole _role;

  @override
  void initState() {
    super.initState();

    userViewmodel = context.read<UserViewmodel>();
    userViewmodel.getUserDetailsCommand.call();
    userViewmodel.getUserDetailsCommand.addListener(_listener);

    userViewmodel.updateCommand.addListener(_updateListener);

    final user = widget.user;

    isAdmin = widget.user?.role == 'ADMIN';
    _name = user?.name ?? '';
    _email = user?.email ?? '';
    _password = '';
    _role = UserRole.fromString(user?.role);
  }

  @override
  void dispose() {
    userViewmodel.getUserDetailsCommand.removeListener(_listener);
    userViewmodel.updateCommand.removeListener(_updateListener);
    super.dispose();
  }

  _updateListener() {
    if (userViewmodel.updateCommand.isSuccess) {
      showShadDialog(
        context: context,
        builder: (context) {
          return ShadDialog.alert(
            title: Text('Sucesso'),
            description: Text('Usuário alterado com sucesso'),
            actions: [
              ShadButton.ghost(
                child: Text('Ok'),

                onPressed: () {
                  if (isAdmin) {
                    Navigator.of(context).pop();
                    userViewmodel.getAllCommand.call();
                  } else {
                    context.read<LoginViewmodel>().logoutCommand.call();
                  }
                },
              ),
            ],

            child: isAdmin
                ? null
                : Text(
                    'Você deve fazer o login novamente para visualizar as alterações',
                  ),
          );
        },
      );
    }
    if (userViewmodel.updateCommand.hasError) {
      final error = (userViewmodel.updateCommand.result as Error).exception;

      ShadToaster.of(context).show(
        ShadToast.destructive(
          title: Text('Ops, algo deu errado...'),
          description: Text((error as AppException).message),

          duration: 5.seconds,
        ),
      );
    }
  }

  _listener() {
    if (userViewmodel.getUserDetailsCommand.isSuccess) {
      final currentUser =
          (userViewmodel.getUserDetailsCommand.result as Ok<UserDetails>).value;
      isSelf = widget.user?.sub == currentUser.sub;
      isAdmin = currentUser.role == 'ADMIN';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: userViewmodel.updateCommand,
      builder: (context, child) {
        return ListenableBuilder(
          listenable: userViewmodel.deleteUserCommand,
          builder: (context, _) {
            return Stack(
              children: [
                ShadDialog(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.user == null
                            ? 'Adicionar Usuário'
                            : 'Editar Usuário',
                      ),
                      if (widget.user != null && !isSelf && isAdmin)
                        ShadButton.ghost(
                          child: Icon(LucideIcons.trash2),
                          onPressed: () async {
                            final canDelete = await showShadDialog<bool>(
                              context: context,
                              builder: (context) {
                                return ShadDialog(
                                  title: Text('Atenção!'),
                                  description: Text(
                                    'Deseja realmente excluir ${widget.user!.name}?',
                                  ),
                                  actions: [
                                    ShadButton.ghost(
                                      child: Text('Cancelar'),
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                    ),
                                    ShadButton(
                                      backgroundColor: colorScheme.destructive,
                                      child: Text(
                                        'Excluir',
                                        style: textTheme.small.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                    ),
                                  ],
                                );
                              },
                            );

                            if (canDelete == true) {
                              userViewmodel.deleteUserCommand.call(
                                widget.user!.sub!,
                              );
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                    ],
                  ),
                  description: Text(
                    widget.user == null
                        ? 'Preencha os dados do novo usuário.'
                        : 'Edite os dados do usuário.',
                  ),
                  actions: [
                    ShadButton.ghost(
                      enabled:
                          !userViewmodel.registerCommand.running &&
                          !userViewmodel.updateCommand.running,
                      child: Text(
                        'Cancelar',
                        style: textTheme.small.copyWith(
                          color: colorScheme.destructive,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(null),
                    ),
                    ShadButton(
                      enabled:
                          !userViewmodel.registerCommand.running &&
                          !userViewmodel.updateCommand.running,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final userUpdate = UpdateUserDTO(
                            name: _name,
                            email: _email,
                            password: _password,
                            role: isAdmin ? _role.name : null,
                          );

                          if (widget.user?.sub != null) {
                            userViewmodel.updateCommand.call(
                              widget.user!.sub!,
                              userUpdate,
                            );
                          } else {
                            userViewmodel.registerCommand.call(
                              CreateUserDTO(
                                name: _name,
                                email: _email,
                                password: _password,
                                role: isAdmin ? _role.name : null,
                              ),
                            );
                          }

                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        widget.user == null ? 'Adicionar' : 'Salvar',
                        style: textTheme.small.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                  child: ShadForm(
                    key: _formKey,
                    child: Column(
                      spacing: 16,
                      children: [
                        ShadInputFormField(
                          initialValue: _name,
                          placeholder: const Text('Nome'),
                          onChanged: (value) => _name = value,
                          validator: (value) =>
                              value.isEmpty ? 'O nome é obrigatório.' : null,
                        ),

                        ShadInputFormField(
                          initialValue: _email,
                          placeholder: const Text('Email'),
                          enabled: isAdmin || widget.user == null,
                          onChanged: (value) => _email = value,
                          validator: (value) =>
                              value.isEmpty || !value.contains('@')
                              ? 'Email inválido.'
                              : null,
                        ),

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
                                placeholder: const Text(
                                  'Digite sua nova senha',
                                ),
                                obscureText: !_isPasswordVisible,
                                onChanged: (value) {
                                  setState(() {
                                    _password = value;
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
                                  backgroundColor:
                                      colorScheme.primaryForeground,
                                  onPressed: () => setState(
                                    () => _isPasswordVisible =
                                        !_isPasswordVisible,
                                  ),
                                  child: Icon(
                                    _isPasswordVisible
                                        ? LucideIcons.eyeOff
                                        : LucideIcons.eye,
                                    size: 16,
                                    color: iconColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (isAdmin)
                          ShadSelect<UserRole>(
                            controller: roleController,
                            header: const Text('Selecione um papel'),
                            allowDeselection: true,
                            onChanged: (selected) {
                              _role = selected ?? UserRole.USER;
                            },
                            placeholder: const Text('Selecione o papel'),
                            padding: const EdgeInsets.all(8),
                            itemCount: UserRole.values.length,
                            options: UserRole.values
                                .map(
                                  (e) => ShadOption(
                                    value: e,
                                    child: Text(e.label),
                                  ),
                                )
                                .toList(),
                            selectedOptionBuilder: (_, value) =>
                                Text(value.label),
                          ),
                      ],
                    ),
                  ),
                ),
                if (userViewmodel.deleteUserCommand.running)
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        );
      },
    );
  }
}
