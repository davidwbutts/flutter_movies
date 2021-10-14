import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppState {
  // notifiers
  final _bottomBarNotifier = BottomBarNotifier();
  BottomBarNotifier get bottomBarNotifier => _bottomBarNotifier;
}


class BottomBarNotifier with ChangeNotifier {
  int _index = 0;
  set index(int value) {
    if(value == _index) return;
    _index = value;
    notifyListeners();
  }
  int get index => _index;
}


class ThemeModeNotifier with ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  set mode(ThemeMode value) {
    if(value == _mode) return;
    _mode = value;
    notifyListeners();
  }
  ThemeMode get mode => _mode;
}