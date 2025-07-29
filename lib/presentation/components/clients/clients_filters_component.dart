import 'package:conectar_users_fe/common/utils/reponsivity_util.dart';
import 'package:conectar_users_fe/models/clients/enum/client_status_enum.dart';
import 'package:conectar_users_fe/models/utils/device_screen_type_enum.dart';
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
  final responsivity = ResponsivityUtil();

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
    final deviceType = responsivity.getDeviceType(context);

    Widget presentationInput = ShadInputFormField(
      onSubmitted: onSend,
      controller: presentationNameEC,
      label: Text(
        'Buscar por nome de fachada',
        style: ShadTheme.of(context).textTheme.small,
      ),
      onChanged: (value) => clientViewmodel.query.presentationName = value,
    );
    Widget socialReasonInput = ShadInputFormField(
      onSubmitted: onSend,
      controller: corporateReason,
      label: Text(
        'Buscar por razão social',
        style: ShadTheme.of(context).textTheme.small,
      ),
      onChanged: (value) => clientViewmodel.query.corporateReason = value,
    );

    Widget cnpjInput = ShadInputFormField(
      onSubmitted: onSend,
      controller: cnpjEC,
      label: Text(
        'Buscar por CNPJ',
        style: ShadTheme.of(context).textTheme.small,
      ),
      onChanged: (value) => clientViewmodel.query.cnpj = value,
    );
    Widget tagsInput = ShadInputFormField(
      onSubmitted: onSend,
      controller: tags,
      label: Text(
        'Buscar por Tags',
        style: ShadTheme.of(context).textTheme.small,
      ),
      placeholder: Text('Separe as tags por vírgulas'),
      onChanged: (String? value) =>
          clientViewmodel.query.tags = value?.split(','),
    );

    Widget statusOption = SizedBox(
      width: size.width * (deviceType == DeviceScreenType.mobile ? .5 : .25),

      child: Column(
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
            onChanged: (value) => clientViewmodel.query.status = value?.value,
            placeholder: SizedBox(
              width:
                  size.width *
                  (deviceType == DeviceScreenType.mobile ? .9 : .28),

              child: Text('Selecione um status'),
            ),
            options: ClientStatusEnum.values
                .map((e) => ShadOption(value: e, child: Text(e.label)))
                .toList(),
            selectedOptionBuilder: (context, value) => Text(value.label),
          ),
        ],
      ),
    );
    Widget conectaPlusWidget = SizedBox(
      width: size.width * (deviceType == DeviceScreenType.mobile ? .5 : .25),
      child: Column(
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
            onChanged: (value) => clientViewmodel.query.conectaPlus = value,
            placeholder: SizedBox(
              width:
                  size.width *
                  (deviceType == DeviceScreenType.mobile ? .9 : .28),

              child: Text('Selecione um status'),
            ),
            options: [
              ShadOption(value: false, child: Text('Não tem conecta+')),
              ShadOption(value: true, child: Text('Tem conecta+')),
            ],
            selectedOptionBuilder: (context, value) =>
                Text('${value ? '' : 'Não '}Tem conecta+'),
          ),
        ],
      ),
    );
    Widget queryButtons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: size.width * .01,
      children: [
        Expanded(
          child: SizedBox(
            child: ShadButton.outline(
              decoration: ShadDecoration(
                border: ShadBorder.all(color: colorScheme.primary),
              ),
              onPressed: cleanFilters,
              child: Text(
                'Limpar campos',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.p.copyWith(
                  color: colorScheme.primary,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: ShadButton(
              decoration: ShadDecoration(
                border: ShadBorder.all(color: colorScheme.primary),
              ),
              onPressed: clientViewmodel.getAllCommand.call,
              child: Text(
                'Filtrar',
                style: textTheme.p.copyWith(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
    if (deviceType == DeviceScreenType.mobile) {
      return ListView(
        shrinkWrap: true,
        children: [
          presentationInput,
          SizedBox(height: size.height * .03),
          socialReasonInput,
          SizedBox(height: size.height * .03),
          cnpjInput,
          SizedBox(height: size.height * .03),
          tagsInput,
          SizedBox(height: size.height * .03),

          Column(
            spacing: size.height * .03,
            children: [
              statusOption,
              conectaPlusWidget,
              SizedBox(height: size.height * .03),
            ],
          ),
          queryButtons,
        ],
      );
    }

    return SizedBox(
      height: size.height * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: size.height * .03,
        children: [
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 3,
              mainAxisSpacing: 3,
              crossAxisSpacing: 15,
            ),
            semanticChildCount: 4,
            shrinkWrap: true,
            children: [
              presentationInput,
              socialReasonInput,
              cnpjInput,
              tagsInput,
            ],
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,

              mainAxisSize: MainAxisSize.min,

              children: [statusOption, conectaPlusWidget],
            ),
          ),
          SizedBox(width: size.width * .3, child: queryButtons),
        ],
      ),
    );
  }
}
