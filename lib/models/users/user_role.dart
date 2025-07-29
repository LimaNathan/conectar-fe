// ignore_for_file: constant_identifier_names

enum UserRole {
  USER('Usuário'),
  ADMIN('Administrador');

  const UserRole(this.label);

  final String label;

  static fromString(String? value) {
    return switch (value) {
      'ADMIN' => UserRole.ADMIN,
      _ => UserRole.USER,
    };
  }
}
