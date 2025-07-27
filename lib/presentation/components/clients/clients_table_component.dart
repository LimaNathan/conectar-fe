import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/clients/dto/clients_pagination_query.dart';
import 'package:conectar_users_fe/models/clients/pagination_result.dart';
import 'package:conectar_users_fe/presentation/components/common/error_component.dart';
import 'package:conectar_users_fe/presentation/components/common/no_data_component.dart';
import 'package:conectar_users_fe/presentation/components/common/pagination_builder.dart';
import 'package:conectar_users_fe/presentation/viewmodels/clients/client_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClientsTable extends StatefulWidget {
  const ClientsTable({super.key});

  @override
  State<ClientsTable> createState() => _ClientsTableState();
}

class _ClientsTableState extends State<ClientsTable> {
  late final ClientViewmodel clientViewmodel;

  ClientsPaginationQuery query = ClientsPaginationQuery(
    page: 1,
    size: 10,
    order: OrderDirection.desc,
  );

  @override
  void initState() {
    super.initState();
    clientViewmodel = context.read<ClientViewmodel>();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return ListenableBuilder(
      listenable: clientViewmodel.getAllCommand,

      builder: (context, _) {
        final columnHeaderTextTheme = textTheme.h4.copyWith(fontSize: 16);

        if (clientViewmodel.getAllCommand.hasError) {
          return ErrorComponent(
            message:
                (clientViewmodel //
                            .getAllCommand
                            .result
                        as Error)
                    .exception
                    .toString(),
          );
        }
        if (clientViewmodel.getAllCommand.running) {
          return Center(child: CircularProgressIndicator());
        }
        if (clientViewmodel.getAllCommand.isSuccess) {
          showWarnSnackBar(String message) {
            ShadToaster.of(context).show(
              ShadToast(
                backgroundColor: colorScheme.accent,
                title: Text('Ops, algo deu errado...'),
                description: Text(message),
              ),
            );
          }

          void onPressedBack(int currentPage) {
            if (currentPage == 1) {
              showWarnSnackBar('Você já está na primeira página...');
              return;
            } else {
              clientViewmodel //
                  .getAllCommand
                  .call((ClientsPaginationQuery.backPage(query)));
            }
          }

          void onPressedFoward(int currentPage, int totalPages) {
            if (currentPage == totalPages) {
              showWarnSnackBar('Parece que você já está na última página...');
              return;
            } else {
              clientViewmodel //
                  .getAllCommand
                  .call((ClientsPaginationQuery.fowardPage(query)));
            }
          }

          final resultValue =
              (clientViewmodel.getAllCommand.result
                      as Ok<ClientPaginationResult>)
                  .value;
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: size.height,
              minHeight: size.height * .6,
              minWidth: size.width,
            ),

            child: ShadTable.list(
              verticalScrollPhysics: NeverScrollableScrollPhysics(),
              columnSpanExtent: (column) {
                if (column == 0) {
                  return FixedSpanExtent(size.width * .25);
                }
                if (column == 1) {
                  return FixedSpanExtent(size.width * .1);
                }

                return FixedSpanExtent(size.width * .15);
              },

              rowSpanBackgroundDecoration: (row) {
                if (row == 0) {
                  return TableSpanDecoration(color: colorScheme.accent);
                }
                return null;
              },
              header: [
                ShadTableCell.header(
                  child: Text('Razão social', style: columnHeaderTextTheme),
                ),
                ShadTableCell.header(
                  child: Text('CNPJ', style: columnHeaderTextTheme),
                ),
                ShadTableCell.header(
                  child: Text('Nome de fachada', style: columnHeaderTextTheme),
                ),
                ShadTableCell.header(
                  child: Text('Tags', style: columnHeaderTextTheme),
                ),
                ShadTableCell.header(
                  child: Text('Status', style: columnHeaderTextTheme),
                ),
                ShadTableCell.header(
                  child: Text('Conecta+', style: columnHeaderTextTheme),
                ),
              ],

              children: [
                ...resultValue.data.map(
                  (element) => [
                    ShadTableCell(
                      child: Text(element.corporateReason ?? 'Não informado'),
                    ),
                    ShadTableCell(child: Text(element.CNPJ ?? 'Não informado')),
                    ShadTableCell(
                      child: Text(element.presentationName ?? 'Não informado'),
                    ),
                    ShadTableCell(
                      child: Text(
                        element.tags
                                ?.map((e) => e)
                                .toString()
                                .replaceAll('()', '') ??
                            '',
                      ),
                    ),
                    ShadTableCell(
                      child: Text(element.clientStatus ?? 'Não informado'),
                    ),
                    ShadTableCell(
                      child: Text(
                        element.conectaPlus != null && element.conectaPlus!
                            ? 'Sim'
                            : 'Não',
                      ),
                    ),
                  ],
                ),
              ],
              footer: [
                ShadTableCell.footer(
                  child: Text('Total: ${resultValue.meta.total}'),
                ),
                ShadTableCell.footer(child: Text('')),
                ShadTableCell.footer(child: Text('')),
                ShadTableCell.footer(child: Text('')),
                ShadTableCell.footer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShadButton.ghost(
                        onPressed: () =>
                            onPressedBack(int.parse(resultValue.meta.page)),
                        child: Icon(LucideIcons.arrowLeft300),
                      ),
                      PaginationBuilder(
                        totalPages: resultValue.meta.lastPage,
                        currentPage: int.parse(resultValue.meta.page),
                        onTap: (index) {
                          clientViewmodel //
                              .getAllCommand
                              .call(
                                (ClientsPaginationQuery.backPage(
                                  query..page = index,
                                )),
                              );
                        },
                      ),

                      ShadButton.ghost(
                        onPressed: () => onPressedFoward(
                          int.parse(resultValue.meta.page),
                          resultValue.meta.lastPage,
                        ),
                        child: Icon(LucideIcons.arrowRight300),
                      ),
                    ],
                  ),
                ),
                ShadTableCell.footer(child: Text('')),
              ],
            ),
          );
        }

        return NoDataComponent(message: 'Nenhum dado para mostrar por aqui.');
      },
    );
  }
}
