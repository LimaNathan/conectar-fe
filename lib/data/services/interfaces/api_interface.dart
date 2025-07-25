abstract class ApiInterface<T> {
  Future<T?> get(String url, {Object? data, Map<String, dynamic>? queryParms});
  Future<T?> post(String url, {Object? data, Map<String, dynamic>? queryParms});
  Future<T?> put(String url, {Object? data, Map<String, dynamic>? queryParms});
  Future<T?> delete(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParms,
  });
}
