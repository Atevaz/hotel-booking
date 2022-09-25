import 'package:booking_hotel/core/shared_preferences/preferences_provider.dart';

class PreferenceHelper {
  final SharedPreferencesProvider preferencesProvider;

  PreferenceHelper({required this.preferencesProvider});

  Future<void> init() async => await preferencesProvider.init();

  Future<String?> getString({required String key}) async {
    final prefs = await preferencesProvider.get();
    return prefs.getString(key);
  }

  Future<double?> getDouble({required String key}) async {
    final prefs = await preferencesProvider.get();
    return prefs.getDouble(key);
  }

  Future<int?> getInt({required String key}) async {
    final prefs = await preferencesProvider.get();
    return prefs.getInt(key);
  }

  Future<bool?> getBool({required String key}) async {
    final prefs = await preferencesProvider.get();
    return prefs.getBool(key);
  }

  Future<List<String>?> getStringList({required String key}) async {
    final prefs = await preferencesProvider.get();
    return prefs.getStringList(key);
  }

  Future<bool> saveDataSharedPreference(
      {required String key, required dynamic value}) async {
    final prefs = await preferencesProvider.get();
    if (value is bool) {
      return await prefs.setBool(key, value);
    } else if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is int) {
      return await prefs.setInt(key, value);
    } else if (value is double) {
      return await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return await prefs.setStringList(key, value);
    } else {
      return false;
    }
  }

  Future<bool> removeData({required String key}) async {
    final prefs = await preferencesProvider.get();
    return await prefs.remove(key);
  }

  Future<bool> contains({required String key}) async {
    final prefs = await preferencesProvider.get();
    return prefs.containsKey(key);
  }

  Future<bool> clearData() async {
    final prefs = await preferencesProvider.get();
    return prefs.clear();
  }
}
