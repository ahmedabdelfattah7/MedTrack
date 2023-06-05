import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async {
    return await _sharedPreferences!.setBool(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return _sharedPreferences!.getString(key);
  }

  static dynamic getBoolData({
    required String key,
  }) {
    return _sharedPreferences!.getBool(key);
  }
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await _sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await _sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      return await _sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      return await _sharedPreferences!.setDouble(key, value);
    } else {
      throw Exception('Invalid value type');
    }
  }

  static Future<bool> removeData() async {
    return await _sharedPreferences!.remove('UserId');
  }
}