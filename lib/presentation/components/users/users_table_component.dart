import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/auth/user_details.dart';
import 'package:conectar_users_fe/models/users/user_pagination_result.dart';
import 'package:conectar_users_fe/presentation/components/common/error_component.dart';
import 'package:conectar_users_fe/presentation/components/common/no_data_component.dart';
import 'package:conectar_users_fe/presentation/components/common/pagination_builder.dart';
import 'package:conectar_users_fe/presentation/components/users/user_dialog_component.dart';
import 'package:conectar_users_fe/presentation/viewmodels/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UsersTable extends StatefulWidget {
  const UsersTable({super.key});

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  late final UserViewmodel userViewmodel;

  @override
  void initState() {
    super.initState();
    userViewmodel = context.read<UserViewmodel>();
    userViewmodel.getAllCommand.call();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    return ListenableBuilder(
      listenable: userViewmodel.getAllCommand,
      builder: (context, _) {
        final columnHeaderTextTheme = textTheme.h4.copyWith(fontSize: 16);

        if (userViewmodel.getAllCommand.hasError) {
          return ErrorComponent(
            message: (userViewmodel.getAllCommand.result as Error).exception
                .toString(),
          );
        }

        if (userViewmodel.getAllCommand.running) {
          return const Center(child: CircularProgressIndicator());
        }

        if (userViewmodel.getAllCommand.isSuccess) {
          final resultValue =
              (userViewmodel.getAllCommand.result as Ok<UserPaginationResult>)
                  .value;

          showWarnSnackBar(String message) {
            ShadToaster.of(context).show(
              ShadToast(
                backgroundColor: colorScheme.accent,
                title: const Text('Atenção...'),
                description: Text(message),
              ),
            );
          }

          void onPressedBack(int currentPage) {
            if (currentPage == 1) {
              showWarnSnackBar('Você já está na primeira página...');
              return;
            }
            userViewmodel.query.backPage();
            userViewmodel.getAllCommand.call();
          }

          void onPressedFoward(int currentPage, int totalPages) {
            if (currentPage == totalPages) {
              showWarnSnackBar('Parece que você já está na última página...');
              return;
            }
            userViewmodel.query.fowardPage();
            userViewmodel.getAllCommand.call();
          }

          if (resultValue.data.isEmpty) {
            showWarnSnackBar(
              'Não foram encontrados dados, refine os filtros ou cadastre um novo usuário.',
            );
            return NoDataComponent(
              message:
                  'Não foram encontrados dados, refine os filtros ou cadastre um novo usuário.',
            );
          }

          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: size.height,
              minHeight: size.height * .6,
              minWidth: size.width,
            ),
            child: ShadTable.list(
              verticalScrollPhysics: const NeverScrollableScrollPhysics(),
              columnSpanExtent: (column) {
                return FixedSpanExtent(size.width * .24);
              },
              rowSpanBackgroundDecoration: (row) {
                if (row == 0) {
                  return TableSpanDecoration(color: colorScheme.accent);
                }
                return null;
              },
              header: [
                ShadTableCell.header(
                  child: Text('Nome', style: columnHeaderTextTheme),
                ),
                ShadTableCell.header(
                  child: Text('E-mail', style: columnHeaderTextTheme),
                ),
                ShadTableCell.header(
                  child: Text('Senha (oculta)', style: columnHeaderTextTheme),
                ),
                ShadTableCell.header(
                  child: Text('Role', style: columnHeaderTextTheme),
                ),
              ],
              onRowTap: (row) {
                if (row == 0) return;
                showShadDialog(
                  context: context,
                  builder: (_) => UserDialog(
                    user: UserDetails(
                      email: resultValue.data[row - 1].email,
                      name: resultValue.data[row - 1].name,
                      sub: resultValue.data[row - 1].id,
                    ),
                  ),
                );
              },
              children: [
                ...resultValue.data.map(
                  (user) => [
                    ShadTableCell(child: Text(user.name ?? 'Não informado')),
                    ShadTableCell(child: Text(user.email ?? 'Não informado')),
                    ShadTableCell(child: const Text('********')),
                    ShadTableCell(child: Text(user.role ?? 'Não informado')),
                  ],
                ),
              ],
              footer: [
                ShadTableCell.footer(
                  child: Text('Total: ${resultValue.meta.total}'),
                ),
                const ShadTableCell.footer(child: SizedBox()),
                ShadTableCell.footer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShadButton.ghost(
                        onPressed: () =>
                            onPressedBack(int.parse(resultValue.meta.page)),
                        child: const Icon(LucideIcons.arrowLeft),
                      ),
                      PaginationBuilder(
                        totalPages: resultValue.meta.lastPage,
                        currentPage: int.parse(resultValue.meta.page),
                        onTap: (page) {
                          userViewmodel.query.page = page;
                          userViewmodel.getAllCommand.call();
                        },
                      ),
                      ShadButton.ghost(
                        onPressed: () => onPressedFoward(
                          int.parse(resultValue.meta.page),
                          resultValue.meta.lastPage,
                        ),
                        child: const Icon(LucideIcons.arrowRight),
                      ),
                    ],
                  ),
                ),
                const ShadTableCell.footer(child: SizedBox()),
              ],
            ),
          );
        }

        return const NoDataComponent(
          message: 'Nenhum dado para mostrar por aqui.',
        );
      },
    );
  }
}
