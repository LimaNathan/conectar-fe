import 'package:conectar_users_fe/data/services/interfaces/local_storage_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorageInterface {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  bool get _usePrefs => kDebugMode;

  @override
  Future<Map<String, String>> getAllValues() async {
    if (_usePrefs) {
      final prefs = await SharedPreferences.getInstance();
      return Map<String, String>.fromEntries(
        prefs.getKeys().map((key) => MapEntry(key, prefs.getString(key) ?? '')),
      );
    }
    return await _secureStorage.readAll();
  }

  @override
  Future<String?> getValue(String key) async {
    if (_usePrefs) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    }
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> writeValue(String key, String value) async {
    if (_usePrefs) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } else {
      await _secureStorage.write(key: key, value: value);
    }
  }

  @override
  Future<void> delete(String key) async {
    if (_usePrefs) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } else {
      await _secureStorage.delete(key: key);
    }
  }
}
