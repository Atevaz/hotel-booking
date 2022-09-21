
import 'preferences_provider.dart';
import 'preferences_service.dart';

class SharedPreferencesServiceImpl implements SharedPreferencesService {
  @override
  SharedPreferencesProvider provider;

  SharedPreferencesServiceImpl({
    required this.provider,
  });

  @override
  Future<void> initSharedPreferencesService() async => await provider.init();

  @override
  Future<String?> getString({
    required String key,
  }) async {
    final prefs = await provider.get();
    return prefs.getString(key);
  }

  @override
  Future<bool> saveString({
    required String key,
    required String value,
  }) async {
    final prefs = await provider.get();
    return await prefs.setString(key, value);
  }

  @override
  Future<bool> removeString({required String key}) async {
    final prefs = await provider.get();
    return await prefs.remove(key);
  }
}
