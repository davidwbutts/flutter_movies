import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movies/app/app.dart';
import 'package:flutter_movies/app/injection/dependency_injection.dart';

void main() async {
  DependencyInjection.dev();
  await dotenv.load();
  runApp(App());
}

