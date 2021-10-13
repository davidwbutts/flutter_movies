

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Local data source for app settings
/// TODO: persist values using SharedPreferences or Hive
class SettingsState {
  SettingsState() {
    _themeModeNotifier = ThemeModeNotifier();
    _isReady.complete(true);
  }

  final _isReady = Completer<bool>();
  Future<bool> get isReady => _isReady.future;

  // setting notifiers
  late ThemeModeNotifier _themeModeNotifier;
  ThemeModeNotifier get themeModeNotifier => _themeModeNotifier;
}

class ThemeModeNotifier with ChangeNotifier {
  ThemeModeNotifier({
    ThemeMode mode = ThemeMode.system,
  }) : _mode = mode, super();

  late ThemeMode _mode;
  set mode(ThemeMode value) {
    if(value == _mode) return;
    _mode = value;
    notifyListeners();
  }
  ThemeMode get mode => _mode;
}



