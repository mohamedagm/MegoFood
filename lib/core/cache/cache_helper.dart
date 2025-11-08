import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      await prefs!.setString(key, value);
    } else if (value is int) {
      await prefs!.setInt(key, value);
    } else if (value is bool) {
      await prefs!.setBool(key, value);
    } else if (value is double) {
      await prefs!.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs!.setStringList(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return prefs!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await prefs!.remove(key);
  }

  static Future<bool> clearAllData() async {
    return await prefs!.clear();
  }
}
