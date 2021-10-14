import 'package:flutter/material.dart';
import 'package:flutter_movies/app/app.dart';
import 'package:flutter_movies/app/injection/dependency_injection.dart';

void main() {
  DependencyInjection.dev();
  runApp(App());
}

