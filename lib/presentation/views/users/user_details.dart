import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/auth/user_details.dart';
import 'package:conectar_users_fe/presentation/components/common/no_data_component.dart';
import 'package:conectar_users_fe/presentation/components/users/user_dialog_component.dart';
import 'package:conectar_users_fe/presentation/viewmodels/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UsersDetailsView extends StatefulWidget {
  const UsersDetailsView({super.key});

  @override
  State<UsersDetailsView> createState() => _UsersDetailsViewState();
}

class _UsersDetailsViewState extends State<UsersDetailsView> {
  late final UserViewmodel userViewmodel;

  @override
  void initState() {
    super.initState();
    userViewmodel = context.read<UserViewmodel>();
    userViewmodel.getUserDetailsCommand.addListener(_listener);
  }

  _listener() {
    if (userViewmodel.getUserDetailsCommand.hasError) {
      final error = userViewmodel.getUserDetailsCommand.result as Error;

      ShadToaster.of(context).show(
        ShadToast.destructive(
          title: Text('Ops, algo deu errado...'),
          description: Text(error.exception.toString()),
        ),
      );
    }
  }

  @override
  void dispose() {
    userViewmodel.getUserDetailsCommand.removeListener(_listener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = ShadTheme.of(context).colorScheme;
    return ListenableBuilder(
      listenable: userViewmodel.getUserDetailsCommand,
      builder: (context, child) {
        if (userViewmodel.getUserDetailsCommand.running) {
          return Center(child: CircularProgressIndicator());
        }
        if (userViewmodel.getUserDetailsCommand.isSuccess) {
          final user =
              (userViewmodel.getUserDetailsCommand.result as Ok<UserDetails>)
                  .value;
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.width * .03,
              horizontal: size.width * .35,
            ),
            child: ShadCard(
              title: Text('Dados do usuário'),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: size.height * .03,
                  children: [
                    ShadAvatar(
                      LucideIcons.user300,
                      size: Size(size.width * .08, size.width * .08),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: size.width * .004,
                      children: [
                        Text(user.name ?? 'Não informado'),
                        ShadButton.ghost(
                          onPressed: () {
                            showShadDialog(
                              context: context,
                              builder: (context) => UserDialog(user: user),
                            );
                          },
                          child: Icon(
                            LucideIcons.penLine,
                            size: 14,
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    Text(user.email ?? 'Não informado'),
                  ],
                ),
              ),
            ),
          );
        } else {
          return NoDataComponent(
            message: 'Nenhum dado do usuário para mostrar',
          );
        }
      },
    );
  }
}
