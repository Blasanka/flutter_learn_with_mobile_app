import 'package:shared_preferences/shared_preferences.dart';

class StorageKeys {
  static final String theme = "THEME";
  static final String authorization = "AUTHORIZATION";
  static final String drawerLocation = "DRAWER_LOCATION";
  static final String notification = "PUSH_NOTIFICATION";
}

class StorageHelper {
  SharedPreferences? _prefs;

  Future<dynamic> _getInstance() async => _prefs = await SharedPreferences.getInstance();

  Future<String?> get(String key) async {
    await _getInstance();
    return _prefs!.getString(key);
  }

  void set(String key, dynamic value) async {
    await _getInstance();
    _prefs!.setString(key, value);
  }

  void remove(String key) async {
    await _getInstance();
    _prefs!.remove(key);
  }
}