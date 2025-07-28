class Endpoints {
  Endpoints._();
  static const String _baseUrl = String.fromEnvironment('BASE_URL');

  // Auth
  static const String register = '$_baseUrl/auth/register';
  static const String login = '$_baseUrl/auth/login';

  // User
  static const String userPaginated = '$_baseUrl/user/paginated';
  static const String userPaginatedInactive =
      '$_baseUrl/user/paginated/inactive';
  static String updateUser(int id) => '$_baseUrl/user/$id';
  static const String deleteUser = '$_baseUrl/user/'; // via query param ?id=

  // Clients
  static const String createClient = '$_baseUrl/clients';
  static const String addUserToClient =
      '$_baseUrl/clients'; // via PUT com query param userId & clientId
  static const String clientPaginated = '$_baseUrl/clients/paginated';
  static String updateClient = '$_baseUrl/clients';
  static const String deleteClient =
      '$_baseUrl/clients'; // via query param ?id=

  static String findByZIPCode(String zip) =>
      'https://viacep.com.br/ws/$zip/json/';
}
