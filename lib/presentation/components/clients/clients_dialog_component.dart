import 'package:conectar_users_fe/common/commands/command_pattern.dart';
import 'package:conectar_users_fe/models/clients/dto/client_dto.dart';
import 'package:conectar_users_fe/models/clients/dto/via_cep_result_dto.dart';
import 'package:conectar_users_fe/presentation/viewmodels/clients/client_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClientDialog extends StatefulWidget {
  final PaginatedClientDTO? client;

  const ClientDialog({super.key, this.client});

  @override
  State<ClientDialog> createState() => _ClientDialogState();
}

class _ClientDialogState extends State<ClientDialog> {
  final _formKey = GlobalKey<ShadFormState>();
  late final ClientViewmodel clientsViewmodel;

  // Campos de cliente
  late String _presentationName;
  late String _CNPJ;
  late String _corporateReason;
  late bool _conectaPlus;
  late List<String> _tags;
  late String _zip;
  AddressDTO? _address;

  @override
  void initState() {
    super.initState();

    clientsViewmodel = context.read<ClientViewmodel>();
    final client = widget.client;
    _presentationName = client?.presentationName ?? '';
    _CNPJ = client?.CNPJ ?? '';
    _corporateReason = client?.corporateReason ?? '';
    _conectaPlus = client?.conectaPlus ?? false;
    _tags = client?.tags ?? [];
    _zip = client?.address?.zipCode ?? '';
    _address =
        client?.address ??
        AddressDTO(
          street: '',
          number: '',
          district: '',
          city: '',
          state: '',
          zipCode: '',
          country: '',
        );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = ShadTheme.of(context).textTheme;
    final colorScheme = ShadTheme.of(context).colorScheme;
    return ListenableBuilder(
      listenable: clientsViewmodel.deleteCommand,
      builder: (context, _) {
        return Stack(
          children: [
            ShadDialog(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.client == null
                        ? 'Adicionar Cliente'
                        : 'Editar Cliente',
                  ),
                  if (widget.client != null)
                    ShadButton.ghost(
                      child: Icon(LucideIcons.trash2200),
                      onPressed: () async {
                        final canDelete = await showShadDialog<bool>(
                          context: context,
                          builder: (context) {
                            return ShadDialog(
                              title: Text('Atenção!'),
                              description: Text(
                                'Você está prestes a excluir ${widget.client?.presentationName}, tem certeza que deseja prosseguir?',
                              ),
                              actions: [
                                ShadButton.ghost(
                                  child: Text('Não'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                ),
                                ShadButton(
                                  backgroundColor: colorScheme.destructive,
                                  hoverBackgroundColor: colorScheme.destructive
                                      .withAlpha(150),
                                  child: Text(
                                    'Sim',
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

                        if (canDelete != null && canDelete) {
                          clientsViewmodel.deleteCommand.call(
                            widget.client!.id!,
                          );
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                ],
              ),
              description: Text(
                widget.client == null
                    ? 'Adicione um novo cliente.'
                    : 'Edite as informações do cliente.',
              ),
              actions: [
                ShadButton.ghost(
                  enabled:
                      !clientsViewmodel.createCommand.running ||
                      !clientsViewmodel.updateCommand.running,
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
                      !clientsViewmodel.createCommand.running ||
                      !clientsViewmodel.updateCommand.running,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.client?.id != null) {
                        clientsViewmodel.updateCommand.call(
                          widget.client!.id!,
                          UpdateClientDTO(
                            CNPJ: _CNPJ,
                            conectaPlus: _conectaPlus,
                            corporateReason: _corporateReason,
                            presentationName: _presentationName,
                            tags: _tags,
                            address: {'create': _address?.toJson()},
                          ),
                        );
                      } else {
                        clientsViewmodel.createCommand.call(
                          CreateClientDTO(
                            presentationName: _presentationName,
                            CNPJ: _CNPJ,
                            corporateReason: _corporateReason,
                            conectaPlus: _conectaPlus,
                            tags: _tags,
                            address: {'create': _address?.toJson()},
                          ),
                        );
                      }
                      _address = null;

                      Navigator.of(context).pop();
                    }
                  },
                  child:
                      !clientsViewmodel.createCommand.running ||
                          !clientsViewmodel.updateCommand.running
                      ? Text(
                          widget.client == null ? 'Adicionar' : 'Salvar',
                          style: textTheme.small.copyWith(color: Colors.white),
                        )
                      : Center(child: CircularProgressIndicator()),
                ),
              ],
              child: ShadForm(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,

                  children: [
                    ShadInputFormField(
                      enabled:
                          !clientsViewmodel.createCommand.running ||
                          !clientsViewmodel.updateCommand.running,
                      initialValue: _presentationName,
                      placeholder: const Text('Nome de Apresentação'),
                      onChanged: (value) => _presentationName = value,
                      validator: (value) => value.isEmpty
                          ? 'O nome de apresentação é obrigatório.'
                          : null,
                    ),

                    ShadInputFormField(
                      enabled:
                          !clientsViewmodel.createCommand.running ||
                          !clientsViewmodel.updateCommand.running,
                      initialValue: _CNPJ,
                      placeholder: const Text('CNPJ'),
                      onChanged: (value) => _CNPJ = value,
                      validator: (value) =>
                          value.isEmpty ? 'O CNPJ é obrigatório.' : null,
                    ),

                    ShadInputFormField(
                      enabled:
                          !clientsViewmodel.createCommand.running ||
                          !clientsViewmodel.updateCommand.running,
                      initialValue: _corporateReason,
                      placeholder: const Text('Razão Social'),
                      onChanged: (value) => _corporateReason = value,
                      validator: (value) => value.isEmpty
                          ? 'A razão social é obrigatória.'
                          : null,
                    ),

                    Row(
                      children: [
                        ShadSwitch(
                          value: _conectaPlus,
                          onChanged: (val) =>
                              setState(() => _conectaPlus = val),
                        ),
                        const SizedBox(width: 8),
                        const Text('Conecta Plus'),
                      ],
                    ),

                    ListenableBuilder(
                      listenable: clientsViewmodel.findByZIPCodeCommand,
                      builder: (context, child) {
                        ViaCepResultDto? viaCepAddress;
                        if (clientsViewmodel.findByZIPCodeCommand.isSuccess) {
                          viaCepAddress =
                              (clientsViewmodel.findByZIPCodeCommand.result
                                      as Ok<ViaCepResultDto>)
                                  .value;

                          _address = _address?.copyWith(
                            street: viaCepAddress.logradouro ?? '',
                            city: viaCepAddress.localidade ?? '',
                            complement: viaCepAddress.complemento,
                            country: 'Brasil',
                            district: viaCepAddress.bairro ?? '',
                            state: viaCepAddress.estado ?? '',
                            zipCode: viaCepAddress.cep ?? '',
                          );
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 16,
                          children: [
                            ShadInputFormField(
                              placeholder: Text(
                                'Informe o CEP para preencher o endereço',
                              ),
                              onChanged: (value) =>
                                  setState(() => _zip = value),
                              enabled:
                                  !clientsViewmodel
                                      .findByZIPCodeCommand
                                      .running ||
                                  !clientsViewmodel.createCommand.running ||
                                  !clientsViewmodel.updateCommand.running,
                              trailing: ShadButton.ghost(
                                enabled:
                                    !clientsViewmodel.createCommand.running ||
                                    !clientsViewmodel.updateCommand.running,
                                onPressed: () => clientsViewmodel
                                    .findByZIPCodeCommand
                                    .call(_zip),
                                child: Icon(LucideIcons.sendHorizontal200),
                              ),
                              onSubmitted:
                                  clientsViewmodel.findByZIPCodeCommand.call,
                            ),

                            if (clientsViewmodel
                                    .findByZIPCodeCommand
                                    .isSuccess ||
                                widget.client?.address != null)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 16,
                                children: [
                                  ShadInputFormField(
                                    enabled:
                                        !clientsViewmodel
                                            .createCommand
                                            .running ||
                                        !clientsViewmodel.updateCommand.running,
                                    initialValue:
                                        viaCepAddress?.logradouro ??
                                        widget.client?.address?.street,
                                    placeholder: const Text('Rua'),
                                    onChanged: (value) => _address = _address
                                        ?.copyWith(street: value),
                                    validator: (value) => value.isEmpty
                                        ? 'A rua é obrigatória.'
                                        : null,
                                  ),
                                  ShadInputFormField(
                                    enabled:
                                        !clientsViewmodel
                                            .createCommand
                                            .running ||
                                        !clientsViewmodel.updateCommand.running,
                                    initialValue:
                                        widget.client?.address?.number,
                                    placeholder: const Text('Número'),
                                    onChanged: (value) => _address = _address
                                        ?.copyWith(number: value),

                                    validator: (value) => value.isEmpty
                                        ? 'O número é obrigatório.'
                                        : null,
                                  ),
                                  ShadInputFormField(
                                    enabled:
                                        !clientsViewmodel
                                            .createCommand
                                            .running ||
                                        !clientsViewmodel.updateCommand.running,
                                    initialValue:
                                        viaCepAddress?.complemento ??
                                        widget.client?.address?.complement,
                                    placeholder: const Text('Complemento'),
                                    onChanged: (value) => _address = _address
                                        ?.copyWith(complement: value),
                                  ),

                                  ShadInputFormField(
                                    enabled:
                                        !clientsViewmodel
                                            .createCommand
                                            .running ||
                                        !clientsViewmodel.updateCommand.running,
                                    initialValue:
                                        viaCepAddress?.bairro ??
                                        widget.client?.address?.district,
                                    placeholder: const Text('Bairro'),
                                    onChanged: (value) => _address = _address
                                        ?.copyWith(district: value),
                                    validator: (value) => value.isEmpty
                                        ? 'O bairro é obrigatório.'
                                        : null,
                                  ),

                                  ShadInputFormField(
                                    enabled:
                                        !clientsViewmodel
                                            .createCommand
                                            .running ||
                                        !clientsViewmodel.updateCommand.running,
                                    initialValue:
                                        viaCepAddress?.localidade ??
                                        widget.client?.address?.city,
                                    placeholder: const Text('Cidade'),
                                    onChanged: (value) => _address = _address
                                        ?.copyWith(city: value),

                                    validator: (value) => value.isEmpty
                                        ? 'A cidade é obrigatória.'
                                        : null,
                                  ),

                                  ShadInputFormField(
                                    enabled:
                                        !clientsViewmodel
                                            .createCommand
                                            .running ||
                                        !clientsViewmodel.updateCommand.running,
                                    initialValue:
                                        viaCepAddress?.uf ??
                                        widget.client?.address?.state,
                                    placeholder: const Text('Estado'),
                                    onChanged: (value) => _address = _address
                                        ?.copyWith(state: value),

                                    validator: (value) => value.isEmpty
                                        ? 'O estado é obrigatório.'
                                        : null,
                                  ),

                                  ShadInputFormField(
                                    enabled:
                                        !clientsViewmodel
                                            .createCommand
                                            .running ||
                                        !clientsViewmodel.updateCommand.running,
                                    initialValue:
                                        widget.client?.address?.country ??
                                        'Brasil',
                                    placeholder: const Text('País'),
                                    onChanged: (value) => _address = _address
                                        ?.copyWith(country: value),
                                    validator: (value) => value.isEmpty
                                        ? 'O país é obrigatório.'
                                        : null,
                                  ),
                                ],
                              ),
                          ],
                        );
                      },
                    ),

                    ShadInputFormField(
                      enabled:
                          !clientsViewmodel.createCommand.running ||
                          !clientsViewmodel.updateCommand.running,
                      initialValue: _tags.join(', '),
                      placeholder: const Text('Tags (separadas por vírgula)'),
                      onChanged: (value) => _tags = value
                          .split(',')
                          .map((e) => e.trim())
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),

            if (clientsViewmodel.deleteCommand.running)
              Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}
