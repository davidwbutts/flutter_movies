
import 'package:flutter/material.dart';

abstract class AppTheme {
  static get light => ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
  );

  static get dark => ThemeData.dark();
}