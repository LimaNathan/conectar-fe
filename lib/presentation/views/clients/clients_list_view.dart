import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/clients/dto/clients_pagination_query.dart';
import 'package:conectar_users_fe/presentation/components/clients/clients_filters_component.dart';
import 'package:conectar_users_fe/presentation/viewmodels/clients/client_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClientsListView extends StatefulWidget {
  const ClientsListView({super.key});

  @override
  State<ClientsListView> createState() => _ClientsListViewState();
}

class _ClientsListViewState extends State<ClientsListView> {
  late final ClientViewmodel clientViewmodel;

  @override
  void initState() {
    super.initState();
    clientViewmodel = context.read<ClientViewmodel>();

    clientViewmodel.getAllCommand
      ..call(
        ClientsPaginationQuery(page: 1, size: 10, order: OrderDirection.desc),
      )
      ..addListener(_listener);
  }

  _listener() {
    if (clientViewmodel.getAllCommand.hasError) {
      final error = (clientViewmodel.getAllCommand.result as Error).exception;

      ShadToaster.of(context).show(
        ShadToast.destructive(
          title: Text('Ops, algo deu errado...'),
          description: Text(error.toString()),
          duration: 5.seconds,
        ),
      );
    }
  }

  @override
  void dispose() {
    clientViewmodel.getAllCommand.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;
    final textTheme = ShadTheme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return ListenableBuilder(
      listenable: clientViewmodel.getAllCommand,
      builder: (context, _) {
        final columnHeaderTextTheme = textTheme.h4.copyWith(fontSize: 16);
        return Column(
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

                      child: ClientsFiltersComponent(),
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
                      'Selecione um cliente para ediar suas informações',
                      style: textStyle.lead.copyWith(fontSize: 12),
                    ),
                    title: Text(
                      'Clientes',
                      style: textStyle.list.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * .01),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ShadButton.outline(
                        decoration: ShadDecoration(
                          border: ShadBorder.all(color: Colors.black),
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

                  if (clientViewmodel.getAllCommand.result is Ok)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: size.height * .6,
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
                            return TableSpanDecoration(
                              color: colorScheme.accent,
                            );
                          }
                          return null;
                        },
                        header: [
                          ShadTableCell.header(
                            child: Text(
                              'Razão social',
                              style: columnHeaderTextTheme,
                            ),
                          ),
                          ShadTableCell.header(
                            child: Text('CNPJ', style: columnHeaderTextTheme),
                          ),
                          ShadTableCell.header(
                            child: Text(
                              'Nome de fachada',
                              style: columnHeaderTextTheme,
                            ),
                          ),
                          ShadTableCell.header(
                            child: Text('Tags', style: columnHeaderTextTheme),
                          ),
                          ShadTableCell.header(
                            child: Text('Status', style: columnHeaderTextTheme),
                          ),
                          ShadTableCell.header(
                            child: Text(
                              'Conecta+',
                              style: columnHeaderTextTheme,
                            ),
                          ),
                        ],

                        children: [
                          ...(clientViewmodel.getAllCommand.result as Ok)
                              .value
                              .data
                              .map(
                                (element) => [
                                  ShadTableCell(
                                    child: Text(
                                      element.corporateReason ??
                                          'Não informado',
                                    ),
                                  ),
                                  ShadTableCell(
                                    child: Text(
                                      element.CNPJ ?? 'Não informado',
                                    ),
                                  ),
                                  ShadTableCell(
                                    child: Text(
                                      element.presentationName ??
                                          'Não informado',
                                    ),
                                  ),
                                  ShadTableCell(child: Text('')),
                                  ShadTableCell(
                                    child: Text(
                                      element.clientStatus ?? 'Não informado',
                                    ),
                                  ),
                                  ShadTableCell(
                                    child: Text(
                                      element.conectaPlus != null &&
                                              element.conectaPlus!
                                          ? 'Sim'
                                          : 'Não',
                                    ),
                                  ),
                                ],
                              )
                              .toList(),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
