import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesManager {

  SharedPreferences _prefs;

  static final SharePreferencesManager _instance = SharePreferencesManager._internal();

  SharePreferencesManager._internal();

  factory SharePreferencesManager() {
    return getInstance();
  }

  static SharePreferencesManager getInstance() {
    return _instance??SharePreferencesManager._internal();
  }

  // Khởi tạo trước khi start app
  Future<void> init() async {
    _prefs == null ? await SharedPreferences.getInstance() : _prefs;
  }

  Future<bool> putString(String key, String value) async {
    await init();
    return await _prefs.setString(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> putInt(String key, int value) async {
    await init();
    return await _prefs.setInt(key, value);
  }

  int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  Future<bool> putDouble(String key, double value) async {
    await init();
    return await _prefs.setDouble(key, value);
  }

  double getDouble(String key) {
    return _prefs.getDouble(key) ?? 0;
  }
}
