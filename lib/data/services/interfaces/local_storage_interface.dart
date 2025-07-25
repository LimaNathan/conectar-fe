abstract interface class LocalStorageInterface {
  Future<String?> getValue(String key);
  Future<void> writeValue(String key, String value);
  Future<Map<String, String>> getAllValues();
  Future<void> delete(String key);
}
