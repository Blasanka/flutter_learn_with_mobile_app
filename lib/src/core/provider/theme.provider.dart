import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/data/datasources/local/storage.helper.dart';
import 'package:srp_parent_mobile/src/core/provider/base.provider.dart';

class ThemeProvider extends BaseProvider {

  ThemeProvider({required this.cacheManager}) {
    cachedTheme;
  }

  StorageHelper cacheManager;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    cacheManager.set(StorageKeys.theme, mode.toString());
  }

  void changeThemeMode() {
    switch(_themeMode.toString()) {
      case "ThemeMode.dark":
        themeMode = ThemeMode.light;
        break;
      case "ThemeMode.light":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
        break;
    }
    notifyListeners();
    print(themeMode.toString());
  }

  Future<ThemeMode> get cachedTheme async {
    String? stored = await cacheManager.get(StorageKeys.theme);
    switch(stored) {
      case "ThemeMode.dark":
        themeMode = ThemeMode.dark;
        break;
      case "ThemeMode.light":
        themeMode = ThemeMode.light;
        break;
      default:
        themeMode = ThemeMode.system;
        break;
    }
    notifyListeners();
    return themeMode;
  }
}