import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/auth/dto/user_dto.dart';
import 'package:conectar_users_fe/models/auth/user_details.dart';
import 'package:conectar_users_fe/presentation/components/users/user_dialog_component.dart';
import 'package:conectar_users_fe/presentation/components/users/users_filters_component.dart';
import 'package:conectar_users_fe/presentation/components/users/users_table_component.dart';
import 'package:conectar_users_fe/presentation/viewmodels/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  late final UserViewmodel userViewmodel;
  bool isAdmin = false;
  @override
  void initState() {
    super.initState();

    userViewmodel = context.read<UserViewmodel>();

    userViewmodel.getAllCommand
      ..call()
      ..addListener(_listener);
  }

  _listener() {
    if (userViewmodel.getUserDetailsCommand.isSuccess) {
      final currentUser =
          (userViewmodel.getUserDetailsCommand.result as Ok<UserDetails>).value;
      isAdmin = currentUser.role == 'ADMIN';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return ListenableBuilder(
      listenable: userViewmodel.getUserDetailsCommand,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.all(size.width * .03),
          child: Column(
            spacing: size.height * .03,
            children: [
              ShadCard(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .0025),
                  child: ShadAccordion<String>(
                    children: [
                      ShadAccordionItem(
                        separator: Container(),
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 28,
                          color: colorScheme.primary,
                        ),
                        value: 'value',
                        title: ListTile(
                          leading: Icon(
                            Icons.search,
                            color: colorScheme.primary,
                            size: 24,
                          ),
                          subtitle: Text(
                            'Filtre e busque itens na página',
                            style: textStyle.lead.copyWith(fontSize: 12),
                          ),
                          title: Text(
                            'Filtros',
                            style: textStyle.list.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        child: UsersFiltersComponent(),
                      ),
                    ],
                  ),
                ),
              ),
              ShadCard(
                padding: EdgeInsets.symmetric(horizontal: size.width * .0025),
                child: Column(
                  spacing: size.height * .003,
                  children: [
                    ListTile(
                      subtitle: Text(
                        'Selecione um usuário para editar suas informações',
                        style: textStyle.lead.copyWith(fontSize: 12),
                      ),
                      title: Text(
                        'Usuários',
                        style: textStyle.list.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    if (isAdmin)
                      Padding(
                        padding: EdgeInsets.only(right: size.width * .01),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ShadButton.outline(
                            decoration: ShadDecoration(
                              border: ShadBorder.all(color: Colors.black),
                            ),
                            onPressed: () async =>
                                await showShadDialog<CreateUserDTO>(
                                  context: context,
                                  builder: (context) => UserDialog(),
                                ),
                            child: Text(
                              'Novo',
                              style: textTheme.p.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),

                    SizedBox(height: size.height * .03),

                    UsersTable(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
