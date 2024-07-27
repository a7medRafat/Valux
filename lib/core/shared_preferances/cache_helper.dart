// Obtain shared preferences.
import 'package:shared_preferences/shared_preferences.dart';

// abstract class CacheHelper {
//   Future<void> init();
//
//   Future<bool> saveData({required String key, required dynamic value});
//
//   dynamic getData({required String key});
//
//   Future<bool> removeData({required String key});
// }
//
// class CacheHelperImpl implements CacheHelper {
//   SharedPreferences? sharedPreferences;
//
//   @override
//   Future<void> init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//
//   @override
//   Future<bool> saveData({required String key, required dynamic value}) async {
//     if (sharedPreferences == null) return false;
//
//     if (value is String) return await sharedPreferences!.setString(key, value);
//     if (value is int) return await sharedPreferences!.setInt(key, value);
//     if (value is bool) return await sharedPreferences!.setBool(key, value);
//     if (value is double) return await sharedPreferences!.setDouble(key, value);
//
//     return false;
//   }
//
//   @override
//   dynamic getData({required String key}) async {
//     if (sharedPreferences == null) return null;
//     return sharedPreferences!.get(key);
//   }
//
//   @override
//   Future<bool> removeData({required String key}) async {
//     if (sharedPreferences == null) return false;
//     return await sharedPreferences!.remove(key);
//   }
// }

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return sharedPreferences!.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }
}
