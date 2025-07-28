import 'package:conectar_users_fe/models/clients/enum/client_status_enum.dart';
import 'package:conectar_users_fe/presentation/viewmodels/clients/client_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClientsFiltersComponent extends StatefulWidget {
  const ClientsFiltersComponent({super.key});

  @override
  State<ClientsFiltersComponent> createState() =>
      _ClientsFiltersComponentState();
}

class _ClientsFiltersComponentState extends State<ClientsFiltersComponent> {
  late final ClientViewmodel clientViewmodel;
  final presentationNameEC = TextEditingController();
  final cnpjEC = TextEditingController();
  final status = ShadSelectController<ClientStatusEnum>();
  final conectaPlus = ShadSelectController<bool>();
  final corporateReason = TextEditingController();
  final tags = TextEditingController();

  @override
  void initState() {
    super.initState();

    clientViewmodel = context.read<ClientViewmodel>();
    cleanFilters();
  }

  cleanFilters() {
    presentationNameEC.clear();
    corporateReason.clear();
    cnpjEC.clear();
    status.value.clear();
    conectaPlus.value.clear();
    clientViewmodel.query.cleanFilters();
    setState(() {});
  }

  onSend(String value) {
    clientViewmodel.getAllCommand.call();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;
    return SizedBox(
      height: size.height * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: size.height * .04,
        children: [
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 5,
              mainAxisSpacing: 3,
              crossAxisSpacing: 15,
            ),
            semanticChildCount: 4,
            shrinkWrap: true,

            children: [
              ShadInputFormField(
                onSubmitted: onSend,
                controller: presentationNameEC,
                label: Text(
                  'Buscar por nome de fachada',
                  style: ShadTheme.of(context).textTheme.small,
                ),
                onChanged: (value) =>
                    clientViewmodel.query.presentationName = value,
              ),
              ShadInputFormField(
                onSubmitted: onSend,

                controller: corporateReason,
                label: Text(
                  'Buscar por razão social',
                  style: ShadTheme.of(context).textTheme.small,
                ),
                onChanged: (value) =>
                    clientViewmodel.query.corporateReason = value,
              ),
              ShadInputFormField(
                onSubmitted: onSend,

                controller: cnpjEC,
                label: Text(
                  'Buscar por CNPJ',
                  style: ShadTheme.of(context).textTheme.small,
                ),

                onChanged: (value) => clientViewmodel.query.cnpj = value,
              ),
              ShadInputFormField(
                onSubmitted: onSend,
                controller: tags,
                label: Text(
                  'Buscar por Tags',
                  style: ShadTheme.of(context).textTheme.small,
                ),

                placeholder: Text('Separe as tags por vírgulas'),
                onChanged: (String? value) =>
                    clientViewmodel.query.tags = value?.split(','),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            spacing: size.width * .008,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buscar por status',
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                  SizedBox(height: size.width * .0053),

                  ShadSelect<ClientStatusEnum>(
                    controller: status,
                    header: Text('Selecione um status'),
                    allowDeselection: true,
                    onChanged: (value) =>
                        clientViewmodel.query.status = value?.value,
                    placeholder: SizedBox(
                      width: size.width * .25,

                      child: Text('Selecione'),
                    ),
                    padding: EdgeInsets.all(size.width * .005),
                    itemCount: ClientStatusEnum.values.length,

                    options: [
                      ShadOption(
                        value: ClientStatusEnum.active,
                        child: Text(ClientStatusEnum.active.label),
                      ),
                      ShadOption(
                        value: ClientStatusEnum.inactive,
                        child: Text(ClientStatusEnum.inactive.label),
                      ),
                    ],

                    selectedOptionBuilder: (context, value) {
                      return SizedBox(
                        width: size.width * .25,

                        child: Text(value.label),
                      );
                    },
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buscar por conectar+',
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                  SizedBox(height: size.width * .0053),
                  ShadSelect<bool>(
                    controller: conectaPlus,
                    header: Text('Selecione um status'),
                    allowDeselection: true,
                    onChanged: (value) =>
                        clientViewmodel.query.conectaPlus = value,
                    placeholder: SizedBox(
                      width: size.width * .25,
                      child: Text('Selecione'),
                    ),
                    padding: EdgeInsets.all(size.width * .005),
                    itemCount: 2,
                    options: [
                      ShadOption(value: false, child: Text('Não tem conecta+')),
                      ShadOption(value: true, child: Text('Tem conecta+')),
                    ],
                    selectedOptionBuilder: (context, value) {
                      return SizedBox(
                        width: size.width * .25,
                        child: Text('${value ? '' : 'Não '}Tem conecta+'),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: size.width * .215,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: size.width * .01,
              children: [
                Expanded(
                  child: ShadButton.outline(
                    decoration: ShadDecoration(
                      border: ShadBorder.all(color: colorScheme.primary),
                    ),
                    onPressed: cleanFilters,
                    child: Text(
                      'Limpar campos',
                      style: textTheme.p.copyWith(
                        color: colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: ShadButton(
                    decoration: ShadDecoration(
                      border: ShadBorder.all(color: colorScheme.primary),
                    ),
                    onPressed: clientViewmodel.getAllCommand.call,

                    child: Text(
                      'Filtrar',
                      style: textTheme.p.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
