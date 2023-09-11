import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/preferences_keys.dart';

class SharedPreferencesService {
  static SharedPreferences? _pref;
  static FlutterSecureStorage? _secure;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
    _secure = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }

  static Future<SharedPreferences> get instance async {
    _pref ??= await SharedPreferences.getInstance();
    return _pref!;
  }

  static Future<void> removeKey(String key) async {
    await _pref!.remove(key);
  }

  static Future<void> saveString(String key, String value) async {
    await _pref!.setString(key, value);
  }

  static String? getString(String key) {
    return _pref!.getString(key);
  }

  static Future<void> saveBool(String key, {required bool value}) async {
    await _pref!.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _pref!.getBool(key);
  }

  static Future<void> saveInt(String key, int value) async {
    await _pref!.setInt(key, value);
  }

  static int? getInt(String? key) {
    return _pref!.getInt(key!);
  }

  static List<String>? getStringList(String key) {
    return _pref!.getStringList(key);
  }

  static bool containsKey(String key) {
    return _pref!.containsKey(key);
  }

  static Future<bool> containsToken() async {
    return await _secure!.containsKey(key: PreferencesKeys.cred);
  }

  static Future<void> saveToken(String value) async {
    await _secure!.write(key: PreferencesKeys.cred, value: value);
  }

  static Future<String?> getToken() async {
    return await _secure!.read(key: PreferencesKeys.cred);
  }

  static Future<void> removeToken() async {
    return _secure!.delete(key: PreferencesKeys.cred);
  }
}
