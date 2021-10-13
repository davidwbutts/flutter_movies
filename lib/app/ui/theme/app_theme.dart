
import 'package:flutter/material.dart';

abstract class AppTheme {
  static get light => ThemeData.light().copyWith(primaryColor: Colors.blueGrey);
  static get dark => ThemeData.dark();
}