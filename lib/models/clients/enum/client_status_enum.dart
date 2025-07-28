enum ClientStatusEnum {
  inactive('Inativo', false),
  active('Ativo', true);

  const ClientStatusEnum(this.label, this.value);
  final String label;
  final bool value;
}
