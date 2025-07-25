import 'package:conectar_users_fe/data/services/interfaces/local_storage_interface.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageImpl implements LocalStorageInterface {
  final _storage = FlutterSecureStorage();
  @override
  Future<Map<String, String>> getAllValues() async {
    return await _storage.readAll();
  }

  @override
  Future<String?> getValue(String key) async {
    return _storage.read(key: key);
  }

  @override
  Future<void> writeValue(String key, String value) async {
    return await _storage.write(key: key, value: value);
  }

  @override
  Future<void> delete(String key) async {
    return await _storage.delete(key: key);
  }
}
