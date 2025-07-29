class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}


class UnauthorizedException extends AppException{
  UnauthorizedException(super.message);
}