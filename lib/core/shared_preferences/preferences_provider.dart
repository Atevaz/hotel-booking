import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesProvider {
  static final _instance = SharedPreferencesProvider._internal();
  bool isInitialized = false;

  static SharedPreferencesProvider get instance => _instance;
  late SharedPreferences _preferences;

  SharedPreferencesProvider._internal();

  Future<SharedPreferences> get() async {
    if (!isInitialized) await init();
    return _preferences;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    isInitialized = true;
  }
}
