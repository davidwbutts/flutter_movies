
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Rough idea for abstracting setting persistence
abstract class PersistedValue<T> {
  T read();
  void write(T value);
}

class ThemeModeSharedPref extends PersistedValue<ThemeMode> {
  ThemeModeSharedPref(this.pref);
  final SharedPreferences pref;

  @override
  ThemeMode read() {
    final index = pref.getInt(_key) ?? 0;
    return _indexMapping[index] ?? ThemeMode.system;
  }

  @override
  void write(ThemeMode value) {
    final index = _modeMapping[value] ?? 0;
    pref.setInt(_key, index);
  }

  static const _indexMapping = <int,ThemeMode>{
    0 : ThemeMode.system,
    1 : ThemeMode.light,
    2 : ThemeMode.dark,
  };

  static const _modeMapping = <ThemeMode,int>{
    ThemeMode.system : 0,
    ThemeMode.light : 1,
    ThemeMode.dark : 2,
  };

  static const _key = 'key_theme_mode';

}