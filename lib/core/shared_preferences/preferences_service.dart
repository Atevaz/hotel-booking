import 'preferences_provider.dart';

abstract class SharedPreferencesService {
  late SharedPreferencesProvider provider;

  Future<void> initSharedPreferencesService();

  Future<bool> saveString({
    required String key,
    required String value,
  });

  Future<String?> getString({
    required String key,
  });

  Future<bool> removeString({
    required String key,
  });
}
