import 'package:conectar_users_fe/models/clients/enum/client_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClientsFiltersComponent extends StatefulWidget {
  const ClientsFiltersComponent({super.key});

  @override
  State<ClientsFiltersComponent> createState() =>
      _ClientsFiltersComponentState();
}

class _ClientsFiltersComponentState extends State<ClientsFiltersComponent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: size.height * .03,
      children: [
        Row(
          spacing: size.width * .015,
          children: [
            Flexible(
              child: ShadInputFormField(
                label: Text(
                  'Buscar por nome',
                  style: ShadTheme.of(context).textTheme.small,
                ),
              ),
            ),
            Flexible(
              child: ShadInputFormField(
                label: Text(
                  'Buscar por CNPJ',
                  style: ShadTheme.of(context).textTheme.small,
                ),
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buscar por status',
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                  SizedBox(height: size.width * .0053),
                  ShadSelect<ClientStatusEnum>(
                    header: Text('Selecione um status'),
                    allowDeselection: true,

                    placeholder: SizedBox(
                      width: size.width,
                      child: Text('Selecione'),
                    ),
                    itemCount: ClientStatusEnum.values.length,
                    optionsPadding: EdgeInsets.symmetric(
                      horizontal: size.width * .0025,
                    ),
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
                        width: size.width,
                        child: Text(value.label),
                      );
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buscar por conectar+',
                    style: ShadTheme.of(context).textTheme.small,
                  ),
                  SizedBox(height: size.width * .0053),
                  ShadSelect<bool>(
                    header: Text('Selecione um status'),
                    allowDeselection: true,

                    placeholder: SizedBox(
                      width: size.width,
                      child: Text('Selecione'),
                    ),
                    itemCount: 2,
                    options: [
                      ShadOption(value: false, child: Text('Não tem conecta+')),
                      ShadOption(value: true, child: Text('Tem conecta+')),
                    ],
                    selectedOptionBuilder: (context, value) {
                      return SizedBox(
                        width: size.width,
                        child: Text('${value ? '' : 'Não '}Tem conecta+'),
                      );
                    },
                  ),
                ],
              ),
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
    );
  }
}
