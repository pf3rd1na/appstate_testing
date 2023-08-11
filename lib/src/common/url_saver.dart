import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static Future<String?> getUrl() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    final result = sharedPrefs.getString('url');
    return result;
  }

  static Future<void> saveUrl(String url) async {
    final sharedPrefs = await SharedPreferences.getInstance();

    await sharedPrefs.setString('url', url);
  }

  static Future<void> clearPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
}
