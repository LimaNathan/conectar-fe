class Endpoints {
  Endpoints._();
  // Auth
  static const String register = 'auth/register';
  static const String login = 'auth/login';

  // User
  static const String userPaginated = 'user/paginated';
  static const String userPaginatedInactive = 'user/paginated/inactive';
  static String updateUser(int id) => 'user/$id';
  static const String deleteUser = 'user/'; // via query param ?id=

  // Clients
  static const String createClient = 'clients';
  static const String addUserToClient =
      'clients'; // via PUT com query param userId & clientId
  static const String clientPaginated = 'clients/paginated';
  static String updateClient(int id) => 'clients/$id';
  static const String deleteClient = 'clients/'; // via query param ?id=
}
