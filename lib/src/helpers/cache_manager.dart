import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static final storage = LocalStorage('any_link_preview');

  static Future<Map<String, dynamic>?> getJson({required String key}) async {
    final data = storage.getItem(key);

    print('getJson ${storage.hashCode}');

    if (data != null) {
      return data as Map<String, dynamic>;
    }
    return null;
  }

  static Future<void> deleteKey(String key, [dynamic takeAction]) async =>
      await storage.deleteItem(key).whenComplete(() => takeAction);

  static Future<void> setJson({
    required String key,
    required Map<dynamic, dynamic> value,
  }) async =>
      await storage.setItem(key, value);
}

// class CacheManager {
//   static Future getJson({required String key}) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     dynamic cache = sharedPreferences.getString(key);
//     var jsonMapCache = jsonDecode(cache) as Map<dynamic, dynamic>;
//     return jsonMapCache;
//   }

//   static Future deleteKey(String key, [dynamic takeAction]) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.remove(key).whenComplete(() => takeAction);
//   }

//   static Future setJson(
//       {required String key, required Map<dynamic, dynamic> value}) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     var jsonMap = value;
//     await sharedPreferences.setString(key, jsonEncode(jsonMap));
//   }
// }
