class Credentials {
  final String email;
  final String password;

  Credentials({required this.email, required this.password});

  Credentials copyWith({
    String? email,
    String? password,
  }) {
    return Credentials(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
